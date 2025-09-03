#SingleInstance Force

RobloxWindow := "Roblox"

imageDir := A_ScriptDir "\Images\AV"

BetterClick(x, y, LR := "Left") 
{ 
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

;Universal Unit Variables

TakX :=263
TakY :=330
SJWX :=402
SJWY :=216
Shield1X := 222
Shield1Y :=160
UpgradeX := 162
UpgradeY := 364



F7::
{
    loop
    {
        If ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Yes.png")
        {
            MouseMove(461,92)
            BetterClick(461,93)
            Placemenmt()
        }
        else if ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Portal.png")
        {
            PortalReward()
            Sleep(1000)
        }
        else if ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Failed.png")
        {
            ;Clicking Portals
            MouseMove(355,439)
            BetterClick(355,440)
            Sleep(1000)
            NextPortal()
        }
        else if ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\ChoosePortal.png")
        {
            MouseMove(355,439)
            BetterClick(355,440)
            Sleep(1000)
            NextPortal()
        }

        Sleep(1000)
    }
}

;Sends Coords
F5::
{
    MouseGetPos &xpos, &ypos 
    MsgBox "The cursor is at X" xpos " Y" ypos
}

;Sield Breaker Coords
F2::
{
    MouseMove(Shield1X,Shield1Y)
}

;Resize and Moves window
F1:: 
{
    if WinExist(RobloxWindow) 
    {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(0, 0, 800, 600, RobloxWindow)
        Sleep 50
        Send "{Tab}"
    }
}


; Define the hotkey to stop loops
H::
{
    ExitApp()
}

PortalReward()
{
    loop 5
    {
        MouseMove(333,70)
        Sleep 250
        BetterClick(333,71)
    }
    MouseMove(290,336)
    BetterClick(290,337)
    Sleep(250)
    MouseMove(338,338)
    BetterClick(338,339)
    Sleep(250)
    MouseMove(397,327)
    BetterClick(397,328)
    Sleep(250)
}

Placemenmt()
{
    while not ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\X.png") ;Checks if unit is placed
    {
        ;Place Takorada First
        Send("5")
        MouseMove(TakX,TakY)
        Sleep(100)
        BetterClick(TakX,TakY + 1)
        ;MsgBox("Place Takorada")
        Sleep(750)
        
    }
    ;MsgBox("Takorada Placed")

    ResetClick() ;To remove current unit selection
    Sleep(500)

    while not ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\X.png") ;Checks if unit is placed
    {
        ;Place SJW
        Send("2")
        MouseMove(SJWX,SJWY)
        Sleep(100)
        BetterClick(SJWX,SJWY + 1)
        Sleep(750)
    }

    BetterClick(315,256) ;Turns on Shadow Ability
    Sleep 500
    BetterClick(367,263) 
    Sleep 500
    BetterClick(196,422) 
    Sleep 500
    BetterClick(711,150) 
    Sleep 500
    ResetClick() ;To remove current unit selection
    Sleep(500)

    ;Shield Breaker 1
    while not ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\X.png") ;Checks if unit is placed
    {

        Send("6")
        MouseMove(Shield1X,Shield1Y)
        Sleep(100)
        BetterClick(Shield1X,Shield1Y + 1)
        Sleep(750)
    }

    ResetClick() ;To remove current unit selection
    Sleep(500)

    ;Shield Breaker 2
    while not ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\X.png") ;Checks if unit is placed
    {
        Send("6")
        MouseMove(Shield1X + 30,Shield1Y)
        Sleep(100)
        BetterClick(Shield1X + 30,Shield1Y)
        Sleep(750)
    }

    ResetClick() ;To remove current unit selection
    Sleep(500)

    ;SHield Breaker 3
    while not ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\X.png") ;Checks if unit is placed
    {
        Send("6")
        MouseMove(Shield1X + 10,Shield1Y+15)
        Sleep(100)
        BetterClick(Shield1X + 10,Shield1Y+15)
        Sleep(750)
    }
    ResetClick() ;To remove current unit selection
    Sleep(500)
    Upgrade()
}

Upgrade()
{
    ;Takorada Upgrade
    MouseMove(TakX-4,TakY-2)
    Sleep(10)
    BetterClick(TakX-4,TakY-3)
    Sleep(1000)
    while ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\X.png")
    {
        if ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Max.png")
        {
            ResetClick() ; Presses X button
            break
        }
        else
        {
            MouseMove(UpgradeX,UpgradeY)
            Sleep(10)
            BetterClick(UpgradeX,UpgradeY+1)
            Sleep(500) 
        }
    }

    ;SJW Upgrade
    MouseMove(SJWX-4,SJWY-2)
    Sleep(10)
    BetterClick(SJWX-4,SJWY-3)
    Sleep(1000)
    while ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\X.png")
    {
        if ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Max.png")
        {
            ResetClick() ; Presses X button
            break
        }
        else
        {
            MouseMove(UpgradeX,UpgradeY)
            Sleep(10)
            BetterClick(UpgradeX,UpgradeY+1)
            Sleep(500) 
        }
    }  
}

NextPortal()
{

    BetterClick(392,440)
    Sleep 500
    MouseMove(200, 250) ; First Portal Slot +80 for next unit
    Sleep 10
    MouseMove(201,251)
    Sleep 250
    Found := False

    Loop 6
    {

        if (ErrorLevel := ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Planet.png"))
        {
            MouseClick
            Sleep 300
            BetterClick(345, 332)
            Found := True
            Break  
        } 

        if (ErrorLevel := ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\PortalYes.png"))
        {
            Sleep 100
            BetterClick(341, 332)
            Found := True
            break
        }



        Sleep 100
        ; Get the current mouse position
        MouseGetPos &currentX, &currentY

        ; Add 80 to the x position for the next unit
        newX := currentX + 80
        newY := currentY

        MouseMove(newX, newY)
        Sleep 50
        MouseMove(newX +1, newY + 1)
        Sleep 500      
    } 
    

    MouseMove(200, 327) ; First Portal Slot Second Row
    Sleep 10
    MouseMove(201,328)
    Sleep 250

    Loop 6
    {
        If (Found = True)
        {
            break
        }
        
        if (ErrorLevel := ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Planet.png"))
        {

            MouseClick
            Sleep 100
            BetterClick(345, 313)
            Found := True
        }

        if (ErrorLevel := ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\PortalYes.png"))
        {
            Sleep 100
            BetterClick(341, 333)
            Found := True
            break
        }


        Sleep 100
        ; Get the current mouse position
        MouseGetPos &currentX, &currentY

        ; Add 80 to the x position for the next unit
        newX := currentX + 80
        newY := currentY

        MouseMove(newX, newY)
        Sleep 50
        MouseMove(newX +1, newY + 1)
        Sleep 500      
    } 

    MouseMove(200, 392) ; First Portal Slot Third Row
    Sleep 10
    MouseMove(201,393)
    Sleep 250

    Loop 6
    {
        If (Found = True)
        {
            break
        }

        if (ErrorLevel := ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\PortalYes.png"))
        {
            Sleep 100
            BetterClick(341, 332)
            Found := True
            break
        }

        if (ErrorLevel := ImageSearch(&FoundX, &FoundY, 0, 0, 800, 600, "*90 " imageDir "\Planet.png"))
        {

            MouseClick
            Sleep 100
            BetterClick(345, 313)
            Found := True
            break 
        }

        Sleep 100
        ; Get the current mouse position
        MouseGetPos &currentX3, &currentY3

        ; Add 80 to the x position for the next unit
        newX3 := currentX3 + 80
        newY3 := currentY3

        MouseMove(newX3, newY3)
        Sleep 50
        MouseMove(newX3 +1, newY3 + 1)
        Sleep 500      
    }
    
}

ResetClick()
{
    BetterClick(287,219) ; Presses X button

}
