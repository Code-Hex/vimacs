### ebox.rb
Shoes.app :title => "vimacs", :width => 200, :height =>  180 do
    stack do
        flow do
            button "Save" do
#                save_as = ask_save_file
                handle = open("noname.text", 'w')
                handle.write(@e.text)
                handle.close
            end
            button "Open" do
                f = ask_open_file
                @e.text = File.read(f)
            end
        end
        @e = edit_box
    end
end
          
