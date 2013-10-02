class TagNavigatorController < ApplicationController
  def tag_navigator
    @UniqueTagCategories = TagCategories.find_by_sql([ 'select distinct(tagCategory) from tag_categories' ]);
    @GroupWithTagsAndTagCategory = []
    @TagCategoryList = []
    @UniqueTagCategories.each do |tagCategoriesList2|
      @GroupWithTagsAndTagCategory = []
      @GroupWithTagsAndTagCategory << tagCategoriesList2.tagCategory
      @TagList = TagCategories.find_by_sql(['select tagName from tag_categories where tagCategory = ?', tagCategoriesList2.tagCategory ]);
      @TagList.each do |tagListEntry|
        @GroupWithTagsAndTagCategory << tagListEntry.tagName
      end
      @TagCategoryList << @GroupWithTagsAndTagCategory
    end
  end

  def tag_details
    $tagName = params[:TagLinkName]

    @ProjectsWithTag = getWorkDetails(Projects, 'projects', TagsInProjects, 'tags_in_projects', $tagName)
    @JobsWithTag = getWorkDetails(Jobs, 'jobs', TagsInJobs, 'tags_in_jobs', $tagName)
    @ClassesWithTag = getWorkDetails(Classes, 'classes', TagsInClasses, 'tags_in_classes', $tagName)

    $RelevantProjectDescriptions = createTextBoxFormatting(@ProjectsWithTag)
    $RelevantJobDescriptions = createTextBoxFormatting(@JobsWithTag)
    $RelevantClassDescriptions = createTextBoxFormatting(@ClassesWithTag)
  end

  def getWorkDetails(rubyGroupTable, dbGroupTable, rubyTagAndGroupTable, dbTagAndGroupTable, tag)
    @WorkCategoryWithTag = []
    @WorkCategoryWithTag = rubyTagAndGroupTable.find_by_sql(['select id from '+dbTagAndGroupTable+' where tagName = ?', tag ]);
    @DescriptionsOfWorkCategoryWithTag = []
    @WorkCategoryWithTag.each do |workCategoryDetails|
      @DescriptionEntry = []
      @DescriptionEntry << rubyGroupTable.find_by_sql(['select timeRange from '+dbGroupTable+' where id = ?', workCategoryDetails.id ]);
      @DescriptionEntry << rubyGroupTable.find_by_sql(['select description from '+dbGroupTable+' where id = ?', workCategoryDetails.id ]);
      @DescriptionsOfWorkCategoryWithTag << @DescriptionEntry
    end

    return @DescriptionsOfWorkCategoryWithTag
  end

  def createTextBoxFormatting(workCategoryDetails)
    $textBoxFormatting = ""
$textBoxFormatting << "<form action='/tag_navigator/tag_details' method='post' id='TagLinkGroup'>
  <input id='TagLinkName' name='TagLinkName' type='hidden' />"
  for tagCategoryEntryIndex in (0..workCategoryDetails.length - 1)
  $textBoxFormatting << "<div class='rounded-corners outer-shadows TagRelevantWorkDescription'>
    <div id='TextBoxHeader'>"
      $textBoxFormatting << workCategoryDetails[tagCategoryEntryIndex][0][0].timeRange
    $textBoxFormatting << "</div>"
    for tagEntryIndex in (1..workCategoryDetails[tagCategoryEntryIndex].length - 1)
    $textBoxFormatting << "<div id='TextBoxBody'>"
    $textBoxFormatting << workCategoryDetails[tagCategoryEntryIndex][tagEntryIndex][0].description
    $textBoxFormatting << "</div>"
    end
  $textBoxFormatting << "</div>"
  end
$textBoxFormatting << "</form>"
    return $textBoxFormatting.html_safe
  end
end
