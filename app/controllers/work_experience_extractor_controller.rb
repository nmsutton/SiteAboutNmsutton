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
    @filePath = params[:workExperienceRecords]

    @projectDescriptions = []
    @jobDescriptions = []
    @classDescriptions = []

    f = File.open(@filePath)
    @doc = Nokogiri::XML(f)
    @projectDescriptions = loadDataFromDocument(@doc, '//Project', :time_range, 'TimeRange/text()', :description, 'Description/text()')
    @jobDescriptions = loadDataFromDocument(@doc, '//WorkEntry', :time_range, 'TimeRange/text()', :description, 'Description/text()')
    @classDescriptions = loadDataFromDocument(@doc, '//Class', :time_range, 'TimeRange/text()', :description, 'Description/text()')
    f.close

    storeDataInDatabase(@projectDescriptions, Project, :time_range, :description)
    storeDataInDatabase(@jobDescriptions, Job, :time_range, :description)
    storeDataInDatabase(@classDescriptions, Classe, :time_range, :description)

    render '/work_experience_extractor/ExtractExperienceSections.html'
  end

  def processTagCategoriesDocument
    @filePath = params[:tagCategoryRecords]

    @tagCategoriesDescriptions = []

    f = File.open(@filePath)
    @doc = Nokogiri::XML(f)
    @tagCategoriesDescriptions = loadDataFromDocument(@doc, '//TagWithCategory', :tag_category, 'Category/text()', :tag_name, 'Tag/text()')
    f.close

    storeDataInDatabase(@tagCategoriesDescriptions, Categorytag, :tag_category, :tag_name)

    extractTags(Project, "projects", Projecttag)
    extractTags(Job, "jobs", Jobtag)
    extractTags(Classe, "classes", Classtag)

    render '/work_experience_extractor/ExtractExperienceSections.html'
  end

  def storeDataInDatabase(sectionDescriptions, table, columnA, columnB)
    @rowGroup = []
    sectionDescriptions.each do |row|
      unless table.exists?(columnA => row[columnA], columnB => row[columnB])
      @rowGroup << table.new(columnA => row[columnA], columnB => row[columnB])
      end
    end
    if (@rowGroup != nil)
    table.import @rowGroup
    end
  end
  
  def loadDataFromDocument(doc, tableName, dbColumnA, sourceDocColumnA, dbColumnB, sourceDocColumnB)
    @parsedDocumentData = doc.xpath(tableName).map do |i|
      {dbColumnA => i.xpath(sourceDocColumnA).text, dbColumnB => i.xpath(sourceDocColumnB).text}
    end
    
    return @parsedDocumentData
  end

  #
  # Descriptions stored in the database are now scanned for keywords that were collected previously
  # from an XML document.  Specific tables store tags found in each work category for convenient
  # future retreival.
  #
  def extractTags(rubyWorkCategoryTable, dbWorkCategoryTable, workCategoryWithTagsTable)
    @tags= []
    @tags = Categorytag.find_by_sql(['select distinct(tag_name) from categorytags']);
    @tagsInWorkCategory = []

    @tags.each do |tag|
      @workCategoryIDsWithTag = []
      @workCategoryIDsWithTag = rubyWorkCategoryTable.find_by_sql(['select id from '+dbWorkCategoryTable+' where description regexp \'.*'+tag.tag_name+'.*\'']);
      @workCategoryIDsWithTag.each do |workCategoryID|
        @tagsInWorkCategory << {:workSectionID => workCategoryID.id, :tagName => tag.tag_name}
      end
    end

    storeDataInDatabase(@tagsInWorkCategory, workCategoryWithTagsTable, :workSectionID, :tagName)
  end
end
