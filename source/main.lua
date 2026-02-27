local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Arwa Hub | V2",
    SubTitle = "بواسطة اروا روجر",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark"
})

-- إنشاء الخانات (Tabs) الأساسية
local Tabs = {
    Player = Window:AddTab({ Title = "اللاعب", Icon = "user" }),
    Server = Window:AddTab({ Title = "السيرفر", Icon = "globe" }),
    Settings = Window:AddTab({ Title = "الإعدادات", Icon = "settings" })
}

-- إعدادات GitHub (تأكدي من مطابقة اسم المستودع)
local repoOwner = "OnlyCryptic"
local repoName = "ArwaHub"
local apiUrl = "https://api.github.com/repos/" .. repoOwner .. "/" .. repoName .. "/git/trees/main?recursive=1"

-- المحرك الذكي لتحميل الملفات من المجلدات المخصصة
local function loadModules()
    local success, response = pcall(function() return game:HttpGet(apiUrl) end)
    if success then
        local data = game:GetService("HttpService"):JSONDecode(response)
        for _, file in pairs(data.tree) do
            -- إذا كان الملف داخل مجلد اللاعب (source/tabs/Player/)
            if file.path:match("source/tabs/Player/.*%.lua$") then
                local rawUrl = "https://raw.githubusercontent.com/" .. repoOwner .. "/" .. repoName .. "/main/" .. file.path
                task.spawn(function()
                    local func = loadstring(game:HttpGet(rawUrl))()
                    if type(func) == "function" then
                        -- نرسل "Tabs.Player" لكي يضيف الملف أزراره داخل هذه الخانة فقط
                        func(Tabs.Player, Fluent) 
                    end
                end)
            end
        end
    end
end

loadModules()
Tabs.Player:Select()
