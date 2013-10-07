# Nate Sutton
# Copyright 2013
#
# This class presents all tags organized by their categories.
# Users can browse through the subjects represented by the
# tags and follow their links for more explanation of them.
#
class TagNavigatorController < ApplicationController
  def tag_navigator
    @UniqueTagCategories = Categorytag.find_by_sql([ 'select distinct(tag_category) from categorytags' ]);
    @GroupWithTagsAndTagCategory = []
    @TagCategoryList = []
    @UniqueTagCategories.each do |uniqueTagCategory|
      @GroupWithTagsAndTagCategory = []
      @GroupWithTagsAndTagCategory << uniqueTagCategory.tag_category
      @TagList = Categorytag.find_by_sql(['select tag_name from categorytags where tag_category = ?', uniqueTagCategory.tag_category ]);
      @TagList.each do |tagListEntry|
        @GroupWithTagsAndTagCategory << tagListEntry.tag_name
      end
      @TagCategoryList << @GroupWithTagsAndTagCategory
    end
  end
end
