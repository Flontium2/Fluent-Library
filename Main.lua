local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Flontium2 = {}
local Tabs = {}

function Flontium2:CreateWindow(Name, des, sub, minimize, Acrylicmode, size)
    if not Name then return end
    if not des or des == "" then des = "" end
    if not minimize or minimize == "" then minimize = Enum.KeyCode.LeftControl end
    if not Acrylicmode then Acrylicmode = true end
    if type(size) ~= "table" then error("Size must be in a table") end
    local Window = Fluent:CreateWindow({
        Title = Name .. des,
        SubTitle = "by " .. sub,
        TabWidth = 120,
        Size = UDim2.fromOffset(size[1], size[2]),
        Acrylic = Acrylicmode,
        Theme = "Dark",
        MinimizeKey = minimize
    })
    return Window
end

function Flontium2:CreateNotify(Title, Content, SubContent)
    if not Title then return end
    if not Content or Content == "" then Content = "Test Notification" end
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

function Flontium2:Section(TabName, Section_Title)
    Tabs[TabName]:AddSection(Section_Title)
end

function Flontium2:Button(TabName, Title, Des, CallBack)
    if not Tabs[TabName] then return end
    if not Title then return end
    if type(CallBack) ~= "function" then
        print("Callback must be a function")
        return
    end

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

function Flontium2:Toggle(TabName, Options, LocalName)
    local LocalToggle = LocalName or "Toggle"

    _G[LocalToggle] = Tabs[TabName]:AddToggle(Options.Title, {
        Title = Options.Title,
        Default = Options.Default or false,
    })

    if Options.OnChanged and type(Options.OnChanged) == "function" then
        _G[LocalToggle]:OnChanged(Options.OnChanged)
    end

    return _G[LocalToggle]
end

function Flontium2:SendKey(bt)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, bt, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, bt, false, game)
end

function Flontium2:CreateUiButton(Link, Key)
    local G3L = {};

    G3L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
    G3L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

    G3L["2"] = Instance.new("ImageButton", G3L["1"]);
    G3L["2"]["BorderSizePixel"] = 0;
    G3L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G3L["2"]["Image"] = Link;
    G3L['2']["Transparency"] = 1
    G3L["2"]["Size"] = UDim2.new(0, 55, 0, 55);
    G3L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G3L["2"]["Position"] = UDim2.new(0.14441, 0, 0.17886, 0);
    G3L["2"].MouseButton1Down:Connect(function()
        Flontium2:SendKey(Key)
    end)

    G3L["2"].Draggable = true
return Flontium2

    G3L["3"] = Instance.new("UICorner", G3L["2"]);
    G3L["3"]["CornerRadius"] = UDim.new(0, 9);
end
print("[Flontium2] Fluent Library - Modified by Flontium2")]]
