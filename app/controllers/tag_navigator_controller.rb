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
end
