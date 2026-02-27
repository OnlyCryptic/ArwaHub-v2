return function(TargetTab, Fluent)
    local Player = game.Players.LocalPlayer
    local Mouse = Player:GetMouse()
    
    _G.Flying = false
    local speed = 50

    TargetTab:AddParagraph({
        Title = "نظام الطيران",
        Content = "قم بتفعيل الطيران واستخدم أزرار التحكم للتحرك"
    })

    TargetTab:AddToggle("FlyToggle", {
        Title = "🚀 تفعيل الطيران",
        Default = false,
        Callback = function(Value)
            _G.Flying = Value
            if Value then
                -- كود بدء الطيران
                local TSource = Player.Character.HumanoidRootPart
                local BG = Instance.new("BodyGyro", TSource)
                local BV = Instance.new("BodyVelocity", TSource)
                BG.P = 9e4
                BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                BG.cframe = TSource.CFrame
                BV.velocity = Vector3.new(0, 0, 0)
                BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
                
                spawn(function()
                    while _G.Flying do
                        task.wait()
                        Player.Character.Humanoid.PlatformStand = true
                        BV.velocity = workspace.CurrentCamera.CFrame.LookVector * speed
                        BG.cframe = workspace.CurrentCamera.CFrame
                    end
                    BG:Destroy()
                    BV:Destroy()
                    Player.Character.Humanoid.PlatformStand = false
                end)
            end
        end
    })

    TargetTab:AddSlider("FlySpeed", {
        Title = "سرعة الطيران",
        Min = 10,
        Max = 300,
        Default = 50,
        Rounding = 1,
        Callback = function(Value)
            speed = Value
        end
    })
end
