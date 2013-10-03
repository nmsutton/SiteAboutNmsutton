# references:
# http://stackoverflow.com/questions/9336039/get-link-and-href-text-from-html-doc-with-nokogiri-ruby

class WorkExperienceExtractorController < ApplicationController
  def ExtractExperienceSections
    filePath = "public/NateSuttonResume.xml"

    processWorkExperienceDocument(filePath)

    extractTags(Projects, "projects")
  end

  def processWorkExperienceDocument(filePath)
    @projectDescriptions = []
    @jobDescriptions = []
    @classDescriptions = []

    retreiveProjectText = false
    retreiveJobText = false
    retreiveClassText = false

    f = File.open(filePath)
    @doc = Nokogiri::XML(f)
    @projectDescriptions = @doc.xpath('//Project').map do |i|
  {'timeRange' => i.xpath('TimeRange/text()'), 'description' => i.xpath('Description/text()')}
  end
    f.close

    #resumeFile = XmlSimple.xml_in(filePath)
    #resumeFile['Resume'].each do |resumeCategories|
    #  resumeCategories.each do |category|
    #    if (category == 'Projects') |ProjectsEntry|
    #      @projectDescriptions << ProjectsEntry[0].split(/\t/)
    #    end
    #  end
    #end

    #IO.foreach(filePath) do |line|
    #  line = line.chomp
    #
    #  if (retreiveProjectText == true)
    #    @projectDescriptions << line.split(/\t/)
    #  elsif (retreiveJobText == true)
    #    @jobDescriptions << line.split(/\t/)
    #  elsif (retreiveClassText == true)
    #    @classDescriptions << line.split(/\t/)
    #  end
    #
    #  retreiveProjectText = extractSection('Detailed Education and Research Experience', line, retreiveProjectText)
    #  retreiveJobText = extractSection('Work Experience', line, retreiveJobText)
    #  retreiveClassText = extractSection('Related Classes', line, retreiveClassText)
    #end

    batch = []
    @projectDescriptions.each do |row|
      batch << Projects.new(:timeRange => row['timeRange'].text, :description => row['description'].text)
      $test2 = row['timeRange']
    end
    Projects.import batch

  end

  def extractSection(sectionDescription, line, toggle)
    if (toggle == true)
      if (line == "")
      toggle = false
      end
    end
    if (line == sectionDescription)
    toggle = true
    end
    return toggle
  end

  def extractTags(rubyWorkCategoryTable, dbWorkCategoryTable)
    @tags= []
    @tags = TagCategories.find_by_sql(['select distinct(tagName) from tag_categories']);
    @tagsInWorkCategory = []
    $test = []

    @tags.each do |tag|
      @workCategoryIDsWithTag = []
      @workCategoryIDsWithTag = rubyWorkCategoryTable.find_by_sql(['select ID from '+dbWorkCategoryTable+' where description regexp \'.*'+tag.tagName+'.*\'']);
      @workCategoryIDsWithTag.each do |workCategoryID|
      #Code for inputting id and tag into category_with_id table
        $test << [workCategoryID, tag]
      end
    end
  end
end
