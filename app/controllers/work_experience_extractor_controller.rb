# Nate Sutton
# Copyright 2013
#
# This controller is designed to extract descriptions from structured document input and
# organize them by section in the database.
#
# references:
# http://stackoverflow.com/questions/9336039/get-link-and-href-text-from-html-doc-with-nokogiri-ruby
class WorkExperienceExtractorController < ApplicationController
  def ExtractExperienceSections
  end

  #
  # This method processes descriptions from a structured document in the form of xml.  Nokogiri is
  # applied for XML parsing.  Attributes of the descriptions in the form of columns are stored for
  # more details.
  #
  def processWorkExperienceDocument
    filePath = params[:workExperienceRecords]

    @projectDescriptions = []
    @jobDescriptions = []
    @classDescriptions = []

    f = File.open(filePath)
    @doc = Nokogiri::XML(f)
    @projectDescriptions = @doc.xpath('//Project').map do |i|
      {:time_range => i.xpath('TimeRange/text()').text, :description => i.xpath('Description/text()').text}
    end
    @jobDescriptions = @doc.xpath('//WorkEntry').map do |i|
      {:time_range => i.xpath('TimeRange/text()').text, :description => i.xpath('Description/text()').text}
    end
    @classDescriptions = @doc.xpath('//Class').map do |i|
      {:time_range => i.xpath('TimeRange/text()').text, :description => i.xpath('Description/text()').text}
    end
    f.close

    storeDataInDatabase(@projectDescriptions, Projects, :time_range, :description)
    storeDataInDatabase(@jobDescriptions, Jobs, :time_range, :description)
    storeDataInDatabase(@classDescriptions, Classes, :time_range, :description)

    render '/work_experience_extractor/ExtractExperienceSections.html'
  end

  def processTagCategoriesDocument
    filePath = params[:tagCategoryRecords]

    @tagCategoriesDescriptions = []

    f = File.open(filePath)
    @doc = Nokogiri::XML(f)
    @tagCategoriesDescriptions = @doc.xpath('//TagWithCategory').map do |i|
      {:tagCategory => i.xpath('Category/text()').text, :tagName => i.xpath('Tag/text()').text}
    end
    f.close

    storeDataInDatabase(@tagCategoriesDescriptions, TagCategories, :tagCategory, :tagName)

    extractTags(Projects, "projects", TagsInProjects)
    extractTags(Jobs, "jobs", TagsInJobs)
    extractTags(Classes, "classes", TagsInClasses)

    render '/work_experience_extractor/ExtractExperienceSections.html'
  end

  def storeDataInDatabase(sectionDescriptions, table, columnA, columnB)
    rowGroup = []
    sectionDescriptions.each do |row|
      unless table.exists?(columnA => row[columnA], columnB => row[columnB])
      rowGroup << table.new(columnA => row[columnA], columnB => row[columnB])
      end
    end
    if (rowGroup != nil)
    table.import rowGroup
    end
  end

  #
  # Descriptions stored in the database are now scanned for keywords that were collected previously
  # from an XML document.  Specific tables store tags found in each work category for convenient
  # future retreival.
  #
  def extractTags(rubyWorkCategoryTable, dbWorkCategoryTable, workCategoryWithTagsTable)
    @tags= []
    @tags = TagCategories.find_by_sql(['select distinct(tagName) from tag_categories']);
    @tagsInWorkCategory = []

    @tags.each do |tag|
      @workCategoryIDsWithTag = []
      @workCategoryIDsWithTag = rubyWorkCategoryTable.find_by_sql(['select id from '+dbWorkCategoryTable+' where description regexp \'.*'+tag.tagName+'.*\'']);
      @workCategoryIDsWithTag.each do |workCategoryID|
        @tagsInWorkCategory << {:workSectionID => workCategoryID.id, :tagName => tag.tagName}
      end
    end

    storeDataInDatabase(@tagsInWorkCategory, workCategoryWithTagsTable, :workSectionID, :tagName)
  end
end
