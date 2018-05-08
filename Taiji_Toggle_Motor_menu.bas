'#Language "WWB.NET"

Option Explicit

Sub Main

    Debug.Print "> MAIN <"

' main function

    Dim SV As Integer
    Dim m_result As Long
    Dim motorpos = printer.cmd_motor_get (paper_motor, motor_position)

        Begin Dialog UserDialog 1500,20,200,150

        Text 50,6,180,30,"Main Menu"
        Text 50,18,180,30,"Motor Position:"
        Text 50,30,180,30,motorpos
        Text 50,42,180,30,"Select an option:"

        PushButton 50,55,100,20,"Press"
        PushButton 50,75,100,20,"Idle Mode"
        PushButton 50,95,100,20,"Cycle Press"
        PushButton 50,115,100,20,"Exit"
        End Dialog

        Dim dlg As UserDialog

        m_result = Dialog(dlg)

    If m_result = 0 Then
        Exit Sub
    End If
    If m_result = 1 Then
        press
    End If
    If m_result = 2 Then
        r_idle
    End If
    If m_result = 3 Then
        cycle
    End If
    If m_result = 4 Then
        Exit Sub
    End If

End Sub

Private Sub release

    Debug.Print "> RELEASE <"

' release motor function
Debug.Print "Releasing motor.."

    printer.cmd_motor_move_rel (paper_motor_, 1400,+5800)
    printer.cmd_motor_wait (paper_motor_,wait_done_)

Debug.Print "Motor released"

    Main

' The following code is skipped as the function essentially loops back to main menu after releasing the motor

'        Dim rresult As Long

'        Begin Dialog UserDialog 1500,20,200,150

'        Text 50,10,180,30,"Current state:"
'        Text 50,30,180,30,"RELEASED"

'        PushButton 50,55,100,20,"Press"
'        PushButton 50,75,100,20,"Idle Mode"
'        PushButton 50,115,100,20,"Exit"
'        End Dialog

'        Dim dlg As UserDialog

'        rresult = Dialog(dlg)

'    If rresult = 0 Then
'        Exit Sub
'    End If
'    If rresult = 1 Then
'        press
'    End If
'    If rresult = 2 Then
'        idle
'    End If
'    If rresult = 3 Then
'        Exit Sub
'    End If

End Sub

Private Sub press

    Debug.Print "> PRESS <"

' press motor function
Debug.Print "Pressing motor.."

     printer.cmd_motor_move_rel (paper_motor_, 1400,-5850)
     printer.cmd_motor_wait (paper_motor_,wait_done_)

Debug.Print "Motor pressed"

        Dim presult As Long
        Dim motorpos = printer.cmd_motor_get (paper_motor, motor_position)

        Begin Dialog UserDialog 1500,20,200,150

        Text 50,6,180,30,"Main Menu"
        Text 50,18,180,30,"Motor Position:"
        Text 50,30,180,30,motorpos
        Text 50,42,180,30,"Select an option:"

        PushButton 50,75,100,20,"Idle Mode"
        PushButton 50,95,100,20,"Release"
        End Dialog

        Dim dlg As UserDialog

        presult = Dialog(dlg)

    If presult = 0 Then
        Exit Sub
    End If
    If presult = 1 Then
        p_idle
    End If
    If presult = 2 Then
        release
    End If

End Sub

Private Sub p_idle

    Debug.Print "> PRESSED IDLE <"

' coming from press mode, the menu options should not reflect the ability to press motor again, instead should have release function
' since printer is in pressed mode, the option to quit program easily should also not be made accessible to the user
' (POST PRESS IDLE)
' NOTE: THIS CODE SHOULD NOT BE USED AS A WAKE PRINTER FUNCTION AS IT DOES NOT ACTUALLY MAINTAIN PRINTER IN AWAKE MODE.

     printer.cmd_motor_wait (paper_motor_,wait_done_)

Debug.Print "Pressed Idle mode is now ACTIVE"

     Dim presult As Long
     Dim motorpos = printer.cmd_motor_get (paper_motor, motor_position)

' timer to be implemented to keep cycle idle mode and prevent printer from sleeping

'     Dim tbef As Long
'     Dim taft As Long
'     Dim tcount As Long
'     Dim tdiff As Long

'     tcount = 10
'     tbef = Timer()
'     taft = tbef + tcount
'     tdiff = taft - tbef
'     Debug.Print Timer
'     Debug.Print tbef
'     Debug.Print taft
'     Debug.Print tdiff

        Begin Dialog UserDialog 1500,20,200,150

        Text 50,6,180,30,"IDLE MODE"
        Text 50,18,180,30,"Motor Position:"
        Text 50,30,180,30,motorpos
        Text 50,42,180,30,"Select an option:"

        PushButton 50,75,100,20,"Cycle Idle"
        PushButton 50,95,100,20,"Release"
        End Dialog

        Dim dlg As UserDialog

        presult = Dialog(dlg)

    If presult = 0 Then
        Exit Sub
    End If
    If presult = 1 Then
        Debug.Print "Cycling Idle mode"
        p_idle
    End If
    If presult = 2 Then
        release
    End If

'    If tdiff = tcount Then
'        printer.cmd_motor_wait (paper_motor_,wait_done_)
'        idle
'    End If

End Sub

Private Sub r_idle

    Debug.Print "> RELEASED IDLE <"

' coming from release mode, the menu options should not reflect the ability to release motor again, instead should have press function
' (POST RELEASE IDLE)
' NOTE: THIS CODE SHOULD NOT BE USED AS A WAKE PRINTER FUNCTION AS IT DOES NOT ACTUALLY MAINTAIN PRINTER IN AWAKE MODE.

     printer.cmd_motor_wait (paper_motor_,wait_done_)

Debug.Print "Released Idle mode is now ACTIVE"

     Dim presult As Long
     Dim motorpos = printer.cmd_motor_get (paper_motor, motor_position)

' timer to be implemented to keep cycle idle mode and prevent printer from sleeping

'     Dim tbef As Long
'     Dim taft As Long
'     Dim tcount As Long
'     Dim tdiff As Long

'     tcount = 10
'     tbef = Timer()
'     taft = tbef + tcount
'     tdiff = taft - tbef
'     Debug.Print Timer
'     Debug.Print tbef
'     Debug.Print taft
'     Debug.Print tdiff

        Begin Dialog UserDialog 1500,20,200,150

        Text 50,6,180,30,"IDLE MODE"
        Text 50,18,180,30,"Motor Position:"
        Text 50,30,180,30,motorpos
        Text 50,42,180,30,"Select an option:"

        PushButton 50,55,100,20,"Press"
        PushButton 50,75,100,20,"Cycle Idle"
        PushButton 50,115,100,20,"Exit"
        End Dialog

        Dim dlg As UserDialog

        presult = Dialog(dlg)

    If presult = 0 Then
        Exit Sub
    End If
    If presult = 1 Then
        press
    End If
    If presult = 2 Then
        Debug.Print "Cycling Idle mode"
        r_idle
    End If
    If presult = 3 Then
        Exit Sub
    End If

'    If tdiff = tcount Then
'        printer.cmd_motor_wait (paper_motor_,wait_done_)
'        idle
'    End If

End Sub

Sub cycle

    Debug.Print "> CYCLE <"
    Debug.Print "Cycling Motor.."

' cycle press then release, once

' press
Debug.Print "Begin pressing motor.."
     printer.cmd_motor_move_rel (paper_motor_, 1400,-5850)
     printer.cmd_motor_wait (paper_motor_,wait_done_)

Debug.Print "Motor Pressed"

' wait 1 second
Debug.Print "Waiting 1 second.."
     Wait 1
Debug.Print "End waiting 1 second"

' release
Debug.Print "Now releasing Motor.."
     printer.cmd_motor_move_rel (paper_motor_, 1400,+5800)
     printer.cmd_motor_wait (paper_motor_,wait_done_)

Debug.Print "Motor Released"

     Main

End Sub
