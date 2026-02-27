return function(TargetTab, Fluent)
    TargetTab:AddParagraph({
        Title = "السرعة",
        Content = "التحكم في سرعة مشي اللاعب"
    })

    TargetTab:AddSlider("WalkSpeed", {
        Title = "سرعة المشي",
        Description = "تعديل سرعة اللاعب الأساسية",
        Default = 16,
        Min = 16,
        Max = 300,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    })
end
