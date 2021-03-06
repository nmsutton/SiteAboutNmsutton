# Nate Sutton
# Copyright 2013
#
# This class includes methods to accept a tag name and generate relevant work
# experience content based on the tag name.  The results returned are seperated
# into sections based on sections in the database.
#
class TagDetailsController < ApplicationController
  def tag_details
    @tagName = params[:parameterName]

    @ProjectsWithTag = getWorkDetails(Project, 'projects', Projecttag, 'projecttags', @tagName)
    @JobsWithTag = getWorkDetails(Job, 'jobs', Jobtag, 'jobtags', @tagName)
    @ClassesWithTag = getWorkDetails(Classe, 'classes', Classtag, 'classtags', @tagName)

    @RelevantProjectDescriptions = createTextBoxFormatting(@ProjectsWithTag)
    @RelevantJobDescriptions = createTextBoxFormatting(@JobsWithTag)
    @RelevantClassDescriptions = createTextBoxFormatting(@ClassesWithTag)
  end

  def getWorkDetails(rubyGroupTable, dbGroupTable, rubyTagAndGroupTable, dbTagAndGroupTable, tag)
    @WorkCategoryWithTag = []
    @WorkCategoryWithTag = rubyTagAndGroupTable.find_by_sql(['select workSectionID from '+dbTagAndGroupTable+' where tagName = ?', tag ]);
    @DescriptionsOfWorkCategoryWithTag = []
    @WorkCategoryWithTag.each do |workCategoryDetails|
      @DescriptionEntry = []
      @DescriptionEntry << rubyGroupTable.find_by_sql(['select time_range from '+dbGroupTable+' where id = ?', workCategoryDetails.workSectionID ]);
      @DescriptionEntry << rubyGroupTable.find_by_sql(['select description from '+dbGroupTable+' where id = ?', workCategoryDetails.workSectionID ]);
      @DescriptionsOfWorkCategoryWithTag << @DescriptionEntry
    end

    return @DescriptionsOfWorkCategoryWithTag
  end

  # This method accepts any collection of descriptions relevant to a tag and
  # organizes css tags to stylize the presentation of the results.  The prefered 
  # css styling is handled externally but formatting to prepare for it is done here.
  #
  def createTextBoxFormatting(workCategoryDetails)
    @textBoxFormatting = ""
    titleIndex = 0
    queryResultIndex = 0;
    for tagCategoryEntryIndex in (0..workCategoryDetails.length - 1)
      @textBoxFormatting << "<div class='rounded-corners outer-shadows TagRelevantWorkDescription'>
      <div id='TextBoxHeader'>"
      @textBoxFormatting << workCategoryDetails[tagCategoryEntryIndex][titleIndex][queryResultIndex].time_range
      @textBoxFormatting << "</div>"
      for tagEntryIndex in (1..workCategoryDetails[tagCategoryEntryIndex].length - 1)
        @textBoxFormatting << "<div id='TextBoxBody'>"
        @textBoxFormatting << workCategoryDetails[tagCategoryEntryIndex][tagEntryIndex][queryResultIndex].description
        @textBoxFormatting << "</div>"
      end
      @textBoxFormatting << "</div>"
    end
    return @textBoxFormatting.html_safe
  end
end
