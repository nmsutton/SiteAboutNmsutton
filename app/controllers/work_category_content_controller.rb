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
