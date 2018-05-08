Option Explicit

Sub Main


    Dim SV As Integer

    OutputText "Script Start"
    Do

        'press
        printer.cmd_motor_move_rel (paper_motor_, 1400,-5800)

        Begin Dialog UserDialog 400,200

        Text 100,25,180,30,"Select One Option"

        OptionGroup .options
           OptionButton 100,60,180,20,"Release and Press"
           OptionButton 100,80,180,20,"Return to idle"

        OKButton 120,120,70,30

            End Dialog

        Dim dlg As UserDialog

        Dialog dlg

        'release
        printer.cmd_motor_move_rel (paper_motor_, 1400,+5850)

        printer.cmd_motor_wait (paper_motor_,wait_done_)

    Loop Until dlg.options

    OutputText "Script Finish"

'    printer.cmd_motor_move_rel (paper_motor_, 1400,+5850)

End Sub
