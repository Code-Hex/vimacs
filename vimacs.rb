require 'rubygems'
require 'green_shoes'
# coding : utf-8

    Shoes.app title: "vimacs", width: 500, height: 400  do
            flow do
                Edit_line = edit_line width: 340
                button "Open" do
                    Choose_files = ask_open_file
                    Edit.text = File.read(Choose_files)
                    Edit_line.text = Choose_files
                end

                button "Indent" do
                    gocha_txt = Edit.text
                    lines = gocha_txt.split $/
                    lines.collect! { |line| '  ' + line }
                    Edit.text = lines.join $/
                end

                button "Clear" do
                    gocha_txt = Edit.text
                    clear_lines = gocha_txt.split $/
                    clear_lines.collect! { |line| '' }
                    Edit.text = clear_lines.join
                end

                stack margin: 5 do

                    Edit = edit_box width: '100%', height: 300, font: "osaka-mono"
                    button "Save", width: '100%' do
                    File.open(Choose_files, 'wb') do |files|
                        files.write Edit.text
                end
            end
                    button "SaveAs", width: '100%' do
                    file = ask_save_file
                    File.open(file, 'wb') do |files|
                    files.write Edit.text
                end
            end

        end
    end
end
