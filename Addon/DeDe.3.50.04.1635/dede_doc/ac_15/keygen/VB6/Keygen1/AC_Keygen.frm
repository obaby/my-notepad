VERSION 5.00
Begin VB.Form Keygen 
   BackColor       =   &H80000007&
   Caption         =   "Keygen for 2Sweet's Delphi Crackme 2.0"
   ClientHeight    =   2475
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5460
   LinkTopic       =   "Form1"
   ScaleHeight     =   2475
   ScaleWidth      =   5460
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      BackColor       =   &H80000012&
      Caption         =   "Serial"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   1095
      Left            =   3000
      TabIndex        =   3
      Top             =   240
      Width           =   2055
      Begin VB.Label Label1 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   480
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H80000007&
      Caption         =   "UserName"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   1095
      Left            =   360
      TabIndex        =   1
      Top             =   240
      Width           =   2055
      Begin VB.TextBox Text1 
         Height          =   375
         Left            =   240
         MaxLength       =   3
         TabIndex        =   2
         Top             =   480
         Width           =   1335
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Get Serial"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   1680
      Width           =   4695
   End
End
Attribute VB_Name = "Keygen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim user
Dim serial
usernumber = Text1.Text
serial = usernumber + 321 + 213
serial = serial + serial * 2
serial = serial - 137
Label1.Caption = serial
End Sub
