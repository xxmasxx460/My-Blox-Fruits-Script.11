--[[ 
    اسم السكربت: Programming Expert Hub (V1)
    المميزات: واجهة رسومية، بحث تلقائي عن البركان، مساعد Draco V4
    التوافق: Delta / Mobile
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Programming Expert - Draco & Volcano", "Midnight")

-- إنشاء التبويب الرئيسي
local Main = Window:NewTab("الرئيسية")
local Section = Main:NewSection("البحث والمهام")

-- متغيرات التحكم (تشغيل/إطفاء)
local AutoVolcano = false
local AutoDraco = false

-- 1. زر تشغيل وإطفاء البحث عن جزيرة البركان
Section:NewToggle("البحث عن جزيرة البركان", "سيقوم بالإبحار التلقائي والبحث في البحر 6", function(state)
    AutoVolcano = state
    if state then
        print("تم تفعيل البحث التلقائي")
        spawn(function()
            while AutoVolcano do
                -- منطق البحث (فحص الأجسام في Workspace)
                for _, obj in pairs(game.Workspace:GetChildren()) do
                    if obj.Name == "PrehistoricIsland" or obj:FindFirstChild("Volcano") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj:GetModelCFrame() + Vector3.new(0, 100, 0)
                        print("!!! تم العثور على الجزيرة !!!")
                    end
                end
                wait(5) -- فحص كل 5 ثوانٍ لتوفير موارد الجهاز
            end
        end)
    else
        print("تم إيقاف البحث")
    end
end)

-- 2. زر تشغيل وإطفاء مساعد Draco V4
Section:NewToggle("مساعد Draco V4 (Auto Kill)", "يساعدك في إنهاء تجربة التنين بسرعة", function(state)
    AutoDraco = state
    if state then
        spawn(function()
            while AutoDraco do
                for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                    if enemy.Name == "Lava Golem" or enemy.Name:find("Draco") then
                        -- انتقال وقتال تلقائي
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    end
                end
                wait(0.1)
            end
        end)
    end
end)

-- تبويب الإعدادات
local Settings = Window:NewTab("الإعدادات")
local SettingSection = Settings:NewSection("التحكم بالواجهة")

SettingSection:NewKeybind("إخفاء القائمة", "اضغط الزر لإخفاء الواجهة", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)

print("تم تحميل الواجهة بنجاح - استمتع باللعب!")
