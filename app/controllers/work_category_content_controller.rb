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
    prepareWorkCategoryDisplay('Projects', Project)
  end
  
  def jobs
    prepareWorkCategoryDisplay('Jobs', Job)
  end
  
  def classes
    prepareWorkCategoryDisplay('Classes', Classe)
  end
  
  def prepareWorkCategoryDisplay(keyword, category)
    @workCategoryKeyword = keyword
    
    @UniqueTags = Categorytag.find_by_sql([ 'select distinct(tag_name) from categorytags' ]);
    
    @WorkCategory = category
    
    render "/work_category_content/display_work_category.html"
  end
end
