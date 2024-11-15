local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Flontium2 = {}
local Tabs = {}

function Flontium2:CreateWindow(Name, des, sub, minimize)
    if not Name then return end
    if not des or des == "" then des = "" end
    if not minimize then minimize = Enum.KeyCode.LeftControl end

    local Window = Fluent:CreateWindow({
        Title = Name .. des,
        SubTitle = "by " .. sub,
        TabWidth = 120,
        Size = UDim2.fromOffset(500, 380),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = minimize
    })
    return Window
end

function Flontium2:CreateNotify(Title, Content, SubContent)
    if not Title then return end
    if not Content or Content == "" then Content = "Tsuo Hub Still Using My Source LOL" end
    if not SubContent or SubContent == "" then SubContent = "" end
    
    Fluent:Notify({
        Title = Title,
        Content = Content,
        SubContent = SubContent,
        Duration = 5
    })
end

function Flontium2:CreateTabs(Window, TabDefinitions)
    for name, value in pairs(TabDefinitions) do
        Tabs[name] = Window:AddTab({
            Title = value.Title,
            Icon = value.Icon or "",
        })
    end
end

function Flontium2:Paragraph(Tab, Title, Content)
    if not Tabs[Tab] or not Title then return end
    if Content == "" then Content = "" end

    Tabs[Tab]:AddParagraph({
        Title = Title,
        Content = Content
    })
end

function Flontium2:Button(TabName, Title, Des, CallBack)
    if not Tabs[TabName] then return end
    if not Title then return end
    if type(CallBack) ~= "function" then print("Callback must be a function") return end

    Tabs[TabName]:AddButton({
        Title = Title,
        Description = Des or "",
        Callback = CallBack
    })
end

function Flontium2:Dropdown(TabName, Options, LocalName)
    local LocalDropdown = LocalName or "Dropdown"
    _G[LocalDropdown] = Tabs[TabName]:AddDropdown(Options.Title, {
        Title = Options.Title,
        Values = Options.Values,
        Multi = Options.Multi or false,
        Default = Options.Default or 1,
    })

    if Options.DefaultValue then
        _G[LocalDropdown]:SetValue(Options.DefaultValue)
    end

    if Options.OnChanged and type(Options.OnChanged) == "function" then
        _G[LocalDropdown]:OnChanged(Options.OnChanged)
    end

    return _G[LocalDropdown]
end
