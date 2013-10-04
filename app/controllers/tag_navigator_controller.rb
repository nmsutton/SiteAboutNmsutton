# Nate Sutton
# Copyright 2013
#
# This class presents all tags organized by their categories.
# Users can browse through the subjects represented by the
# tags and follow their links for more explanation of them.
#
class TagNavigatorController < ApplicationController
  def tag_navigator
    @UniqueTagCategories = TagCategories.find_by_sql([ 'select distinct(tagCategory) from tag_categories' ]);
    @GroupWithTagsAndTagCategory = []
    @TagCategoryList = []
    @UniqueTagCategories.each do |uniqueTagCategory|
      @GroupWithTagsAndTagCategory = []
      @GroupWithTagsAndTagCategory << uniqueTagCategory.tagCategory
      @TagList = TagCategories.find_by_sql(['select tagName from tag_categories where tagCategory = ?', uniqueTagCategory.tagCategory ]);
      @TagList.each do |tagListEntry|
        @GroupWithTagsAndTagCategory << tagListEntry.tagName
      end
      @TagCategoryList << @GroupWithTagsAndTagCategory
    end
  end
end
