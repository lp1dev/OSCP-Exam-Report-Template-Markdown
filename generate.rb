#!/usr/bin/env ruby

# original ruby script by noraj - https://github.com/noraj
# updates/overhaul by initinfosec - https://github.com/initinfosec - 05 JUN 2020


#array for template choices
templates = [
  {
    name: 'Fenrir Pentest Report',
    path: 'src/fenrir_Pentest_report.md'
  }
]

# Choose template
# puts 'Report Templace Choices:'
# templates.each_with_index do |t,i|
#   puts "#{i}. #{t[:name]}"
# end
# print 'Choose a template #:  '
# choice = gets.chomp
# src = templates[choice.to_i][:path]
# sel = templates[choice.to_i][:name]
# puts "Using #{sel}"
# puts ""
src = templates[0][:path]
sel = templates[0][:name]

# preface
puts "This script assumes you've already placed your writeup contents into #{src}\nIf not, press Q to exit script, place report content into desired template, and re-run script.\nIf ready & correct selection is made, press any other key to continue."
puts ""
resp = gets.chomp
exit if resp == 'q' || resp == 'Q'

# Enter the report ID
puts 'Enter the report id #'
print 'id: '
val = gets.chomp
report_id = val
puts ""

# Enter the client name
puts 'Enter the client name #'
print 'name: '
val = gets.chomp
client_name = val
puts ""

# Enter your name
puts 'Enter your name #'
print 'name: '
val = gets.chomp
name = val
puts ""


# Enter your email
puts 'Enter your email'
print 'email:  '
val = gets.chomp
email = val
puts ""

# write email & OS-ID to cover page via md header

file_data = ""
keyword = "author: "
replacement = "author: ['#{name} (Fenrir.pro) - #{email}']"
IO.foreach(src) do |line|
   file_data += line.gsub(/^.*#{Regexp.quote(keyword)}.*$/, replacement)
end

File.open(src, 'w') do |line|
   line.write file_data
end
   

# get date of report
currDate = Time.now.strftime("%F")
date = currDate
puts "Enter date of report in YYYY-MM-DD format. (or enter for #{currDate})"
print "Date (YYYY-MM-DD):  "
val = gets.chomp
date = val unless val.empty?
puts "Report date set as #{date}."
puts ""

# write report date to cover page via md header

file_data = ""
keyword = "date: "
replacement = "date: '#{date}'"
IO.foreach(src) do |line|
   file_data += line.gsub(/^.*#{Regexp.quote(keyword)}.*$/, replacement)
end

File.open(src, 'w') do |line|
   line.write file_data
end


# choose report type

#array for report types
reportType = [
  {
    name: "Pentest #{client_name}",
    value: 'Test d\'Intrusion',
    title: "# Rapport de Test d\'Intrusion #{client_name}"
  },

  {
    name: 'Intervention',
    value: 'Rapport d\'Intervention',
    title: "# Rapport d'Intervention #{client_name}"
  }
]

# Choose report type
report = reportType[0][:name]
title = reportType[0][:title]
sel = reportType[0][:name]
puts "Report Types:"

reportType.each_with_index do |r,i|
  puts "#{i}. #{r[:name]}"
end
print "Choose Report Type # (current selection: #{sel}):  "
choice = gets.chomp
sel = reportType[choice.to_i][:name] unless choice.empty?
report = reportType[choice.to_i][:value] unless choice.empty?
title = reportType[choice.to_i][:title] unless choice.empty?
puts "Report type chosen: #{sel}"
puts ""

# change report type on md header in report file
file_data = ""
keyword = "subtitle: "
replacement = "subtitle: #{report}"
IO.foreach(src) do |line|
   file_data += line.gsub(/^.*#{Regexp.quote(keyword)}.*$/, replacement)
end

File.open(src, 'w') do |line|
   line.write file_data
end

   
# change report type in main title of report
file_data = ""
keyword = "# Offensive Security"
replacement = "#{title}"
IO.foreach(src) do |line|
   file_data += line.gsub(/^.*#{Regexp.quote(keyword)}.*$/, replacement)
end

File.open(src, 'w') do |line|
   line.write file_data
end



#array for syntax highlight style choices
syntaxStyles = [

  {
    name: 'breezedark',
    value: 'breezedark'
  },
  {
     name: 'espresso',
     value: 'espresso'
   },
   {
     name: 'haddock',
     value: 'haddock'
    },
    {
     name: 'kate',
     value: 'kate'
    },
   {
     name: 'monochrome',
     value: 'monochrome'
    },
   {
     name: 'pygments',
     value: 'pygments'
    },
   {
     name: 'tango',
     value: 'tango'
    },
   {
     name: 'zenburn',
     value: 'zenburn'
    }
]

# Choose syntax highlight style
style = 'tango'
sel = 'tango'
puts "Choose syntax highlight style # (current selection: #{style}):  "
syntaxStyles.each_with_index do |s,i|
  puts "#{i}. #{s[:name]}"
end
print 'syntax highlight style #:  '
choice = gets.chomp
style = syntaxStyles[choice.to_i][:value] unless choice.empty?
sel = syntaxStyles[choice.to_i][:name] unless choice.empty?
puts "Using #{sel} as syntax highlight style."
puts ""


#array for title page colour choices
pageColour = [
  {
    name: 'FenrirBlue',
    value: %Q("6196b4")
  },
  # {
  #   name: 'White',
  #   value: %Q("FFFFFF")
  # },
  # {
  #    name: 'Black',
  #    value: %Q("000000")
  #  },
  #  {
  #    name: 'DarkGreen',
  #    value: %Q("006400")
  #  },
  #  {
  #     name: 'Snow',
  #     value: %Q("FFFAFA")
  #  },
  #  {
  #    name: 'Crimson',
  #    value: %Q("DC143C")
  #   },
  #  {
  #    name: 'SpringGreen (mint/lively green)',
  #    value: %Q("00FF7F")
  #   },
  #  {
  #    name: 'DodgerBlue (mid/bright blue)',
  #    value: %Q("1E90FF")
  #   },
  #  {
  #    name: 'DarkSlateBlue',
  #    value: %Q("483D8B")
  #   },
  #  {
  #    name: 'Gold',
  #    value: %Q("FFD700")
  #   },
  #  {
  #    name: 'PapayaWhip (light tan)',
  #    value: %Q("FFEFD5")
  #   },
  #  {
  #    name: 'DarkOrange',
  #    value: %Q("FF8C00")
  #   },
  #  {
  #    name: 'PurpleTaupe',
  #    value: %Q("50394C")
  #   },
  #  {
  #    name: 'Drover (yellow cream)',
  #    value: %Q("FFEF96")
  #   },
  #  {
  #    name: 'custom color (user-defined hex value)',
  #    value: 'custom'
  #   }
]

# Choose title page background colour
titlepageColor = '6196b4'
sel = 'FenrirBlue'
puts "Title Page Background Color Options:"

pageColour.each_with_index do |c,i|
  puts "#{i}. #{c[:name]}"
end

print "Title Page Background Color # (current selection: #{sel}):  "
choice = gets.chomp
sel = pageColour[choice.to_i][:name] unless choice.empty?
val = pageColour[choice.to_i][:value] unless choice.empty?

if val == "custom"
  puts ""
  puts "Enter the 6 character hex value for the color you want to use, without the # symbol"
  print "Hex color code: #"
  choice = gets.chomp
  sel = 'user defined color ' + choice unless choice.empty?
  titlepageColor = choice unless choice.empty?
else
  titlepageColor = pageColour[choice.to_i][:value] unless choice.empty?
end

puts "Using #{sel} for Title Page Background Color"
puts ""

# change titlepage-color on md header in report file
file_data = ""
keyword = "titlepage-color"
replacement = "titlepage-color: #{titlepageColor}"
IO.foreach(src) do |line|
   file_data += line.gsub(/^.*#{Regexp.quote(keyword)}.*$/, replacement)
end

File.open(src, 'w') do |line|
   line.write file_data
end
   

# array for title page text color

textColour = [

  {
    name: 'White',
    value: %Q("FFFFFF")
  },
  {
     name: 'Black',
     value: %Q("000000")
   },
   {
      name: 'Snow',
      value: %Q("FFFAFA")
   },
   {
     name: 'DarkGreen',
     value: %Q("006400")
   },
   {
     name: 'PurpleTaupe',
     value: %Q("50394C")
   },
   {
     name: 'custom color (user-defined hex value)',
     value: 'custom'
    }
]

# Choose title page text colour
sel = 'White'
titlepageTextColor = %Q("FFFFFF")
puts "Choose Title Page Text Color Options:"
textColour.each_with_index do |c,i|
  puts "#{i}. #{c[:name]}"
end
print "Title Page Text Color # (current selection: #{sel}):  "
choice = gets.chomp
sel = textColour[choice.to_i][:name] unless choice.empty?
val = textColour[choice.to_i][:value] unless choice.empty?
if val == "custom"
  puts ""
  puts "Enter the 6 character hex value for the color you want to use, without the # symbol"
  print "Hex color code: #"
  choice = gets.chomp
  sel = 'user defined color ' + choice unless choice.empty?
  titlepageTextColor = choice unless choice.empty?
else
  titlepageTextColor = textColour[choice.to_i][:value] unless choice.empty?
end

puts "Using #{sel} for Title Page Text Color."
puts ""



# change titlepage-text-color on md header in report file
file_data = ""
keyword = "titlepage-text-color"
replacement = "titlepage-text-color: #{titlepageTextColor}"
IO.foreach(src) do |line|
   file_data += line.gsub(/^.*#{Regexp.quote(keyword)}.*$/, replacement)
end

File.open(src, 'w') do |line|
   line.write file_data
end



# Generating report
puts 'Generating report...'
pdf = "output/fenrir-#{report_id}-Rapport.pdf"
zipfile = "output/fenrir-#{report_id}-Rapport.7z"
%x(pandoc #{src} -o #{pdf} \
  --from markdown+yaml_metadata_block+raw_html \
  --template eisvogel \
  --table-of-contents \
  --toc-depth 6 \
  --number-sections \
  --top-level-division=chapter \
  --highlight-style #{style}
)

# Generating archive
puts 'Generating password-protected 7z archive...'
%x(7z a output/fenrir-#{report_id}-Rapport.7z \
  -p#{report_id} \
  #{File.expand_path(pdf)}
)

puts "Generated as #{pdf} & #{zipfile}"
puts ""
puts 'Complete. Please double-check for accuracy before submittal.'
puts ""
