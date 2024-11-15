local FluentWindow = Flontium2:CreateWindow("Test", "", "Flontium2")
Flontium2:CreateTabs(FluentWindow, {
    Main = { Title = "Main", Icon = "" },
})

Flontium2:CreateNotify("NoName Hub", "", "")
Flontium2:Paragraph("Main", "A", "Test")
Flontium2:Button("Main", "Test", "", function()
    print("Test")
end)
Flontium2:Dropdown("Main", {
    Title = "Main Options",
    Values = {"Option A", "Option B", "Option C"},
    DefaultValue = "Option B",
    Multi = false,
    OnChanged = function(v)
        print(v)
    end,
}, "MainDropdown")
