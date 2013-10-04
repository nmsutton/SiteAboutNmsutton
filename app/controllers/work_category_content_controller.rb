# Nate Sutton
# Copyright 2013
#
# Individual pages are generated for each work category.  The pages are automatically
# populated by the corresponding sections in the database.  All stored content for the
# categories can be quickly reviewed
#
class WorkCategoryContentController < ApplicationController
  def choose_work_category
  end

  def display_work_category
  end
  
  def projects
    @workCategoryKeyword = 'Projects'
    
    @UniqueTags = TagCategories.find_by_sql([ 'select distinct(tagName) from tag_categories' ]);
    
    @WorkCategory = Projects
    
    render "/work_category_content/display_work_category.html"
  end
  
  def jobs
    @workCategoryKeyword = 'Jobs'
    
    @UniqueTags = TagCategories.find_by_sql([ 'select distinct(tagName) from tag_categories' ]);
    
    @WorkCategory = Jobs
    
    render "/work_category_content/display_work_category.html"
  end
  
  def classes
    @workCategoryKeyword = 'Classes'
    
    @UniqueTags = TagCategories.find_by_sql([ 'select distinct(tagName) from tag_categories' ]);
    
    @WorkCategory = Classes
    
    render "/work_category_content/display_work_category.html"
  end
end
