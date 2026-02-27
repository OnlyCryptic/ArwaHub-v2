return function(TargetTab, Fluent)
    TargetTab:AddToggle("FlyToggle", {
        Title = "تفعيل الطيران",
        Default = false,
        Callback = function(Value)
            -- كود الطيران الخاص بكِ هنا
            print("Fly Status: ", Value)
        end
    })
end
