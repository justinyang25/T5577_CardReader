VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   Caption         =   "T5557/T55XX读写 传慧电子 https://shop72473760.taobao.com "
   ClientHeight    =   6435
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10470
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   6435
   ScaleWidth      =   10470
   StartUpPosition =   2  '屏幕中心
   Begin VB.Frame Frame7 
      Caption         =   "天线计算器"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1275
      Left            =   5850
      TabIndex        =   84
      Top             =   3120
      Width           =   4485
      Begin MSCommLib.MSComm MSComm1 
         Left            =   2550
         Top             =   660
         _ExtentX        =   1005
         _ExtentY        =   1005
         _Version        =   393216
         DTREnable       =   -1  'True
         RThreshold      =   1
         SThreshold      =   1
         InputMode       =   1
      End
      Begin VB.CommandButton Command27 
         Caption         =   "电 感"
         Height          =   285
         Left            =   120
         TabIndex        =   93
         Top             =   780
         Width           =   645
      End
      Begin VB.CommandButton Command26 
         Caption         =   "电 容"
         Height          =   285
         Left            =   120
         TabIndex        =   92
         Top             =   360
         Width           =   645
      End
      Begin VB.CommandButton Command25 
         Caption         =   "频 率"
         Height          =   285
         Left            =   2430
         TabIndex        =   91
         Top             =   360
         Width           =   645
      End
      Begin VB.TextBox Text16 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3240
         TabIndex        =   87
         Text            =   "00000"
         Top             =   360
         Width           =   615
      End
      Begin VB.TextBox Text15 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   870
         TabIndex        =   86
         Text            =   "00000"
         Top             =   780
         Width           =   615
      End
      Begin VB.TextBox Text14 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   870
         TabIndex        =   85
         Text            =   "00000"
         Top             =   360
         Width           =   615
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         Caption         =   "KHz"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   3930
         TabIndex        =   90
         Top             =   390
         Width           =   315
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         Caption         =   "uH"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   1560
         TabIndex        =   89
         Top             =   810
         Width           =   210
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         Caption         =   "pF"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   1560
         TabIndex        =   88
         Top             =   390
         Width           =   210
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "EM4100操作"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   5850
      TabIndex        =   77
      Top             =   1770
      Width           =   4485
      Begin VB.ComboBox Combo7 
         Height          =   300
         ItemData        =   "Form1.frx":0CCE
         Left            =   3180
         List            =   "Form1.frx":0CD8
         TabIndex        =   83
         Text            =   "Combo7"
         Top             =   450
         Width           =   1005
      End
      Begin VB.CommandButton Command24 
         Caption         =   "写 卡"
         Height          =   345
         Left            =   3210
         TabIndex        =   81
         Top             =   870
         Width           =   1005
      End
      Begin VB.CommandButton Command23 
         Caption         =   "读 卡"
         Height          =   345
         Left            =   1860
         TabIndex        =   80
         Top             =   870
         Width           =   1095
      End
      Begin VB.TextBox Text13 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   780
         TabIndex        =   78
         Text            =   "0000000000"
         Top             =   450
         Width           =   1155
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         Caption         =   "基卡："
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   2430
         TabIndex        =   82
         Top             =   480
         Width           =   630
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         Caption         =   "卡号："
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   79
         Top             =   480
         Width           =   630
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "串口设置"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1635
      Left            =   8670
      TabIndex        =   74
      Top             =   90
      Width           =   1665
      Begin VB.CommandButton Command22 
         Caption         =   "打 开"
         Height          =   375
         Left            =   720
         TabIndex        =   76
         Top             =   1170
         Width           =   825
      End
      Begin VB.ComboBox Combo6 
         Height          =   300
         ItemData        =   "Form1.frx":0CEB
         Left            =   150
         List            =   "Form1.frx":0CED
         TabIndex        =   75
         Top             =   390
         Width           =   1395
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H000000FF&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00000000&
         Height          =   285
         Left            =   120
         Shape           =   3  'Circle
         Top             =   1200
         Width           =   405
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "第1页读"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1635
      Left            =   5850
      TabIndex        =   51
      Top             =   90
      Width           =   2805
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   8
         Left            =   1830
         TabIndex        =   98
         Top             =   810
         Width           =   885
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   0
         Left            =   1830
         TabIndex        =   97
         Top             =   390
         Width           =   855
      End
      Begin VB.CommandButton Command29 
         BackColor       =   &H00FFC0C0&
         Caption         =   "写入数据"
         Height          =   345
         Left            =   690
         Style           =   1  'Graphical
         TabIndex        =   96
         Top             =   1200
         Width           =   885
      End
      Begin VB.TextBox Text10 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   870
         TabIndex        =   54
         Text            =   "00000000"
         Top             =   780
         Width           =   945
      End
      Begin VB.TextBox Text11 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   870
         TabIndex        =   53
         Text            =   "00000000"
         Top             =   390
         Width           =   945
      End
      Begin VB.CommandButton Command7 
         BackColor       =   &H00FFC0C0&
         Caption         =   "读取数据"
         Height          =   345
         Left            =   1800
         Style           =   1  'Graphical
         TabIndex        =   52
         Top             =   1200
         Width           =   855
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         Caption         =   "第2块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   56
         Top             =   840
         Width           =   525
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         Caption         =   "第1块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   55
         Top             =   450
         Width           =   525
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "页0读写操作"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4335
      Left            =   60
      TabIndex        =   25
      Top             =   90
      Width           =   5775
      Begin VB.ComboBox Combo8 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "Form1.frx":0CEF
         Left            =   120
         List            =   "Form1.frx":0D0B
         TabIndex        =   95
         Text            =   "Combo8"
         Top             =   3690
         Width           =   1005
      End
      Begin VB.CheckBox Check10 
         Caption         =   "保护读/写（有密码）"
         Height          =   435
         Left            =   4410
         TabIndex        =   73
         Top             =   3090
         Width           =   1245
      End
      Begin VB.TextBox Text12 
         BackColor       =   &H00FFC0FF&
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   4680
         TabIndex        =   71
         Text            =   "00000000"
         Top             =   3660
         Width           =   945
      End
      Begin VB.CommandButton Command21 
         Caption         =   "写"
         Height          =   315
         Left            =   3420
         TabIndex        =   70
         Top             =   3030
         Width           =   885
      End
      Begin VB.CommandButton Command20 
         Caption         =   "读"
         Height          =   315
         Left            =   2760
         TabIndex        =   69
         Top             =   3030
         Width           =   525
      End
      Begin VB.CommandButton Command19 
         Caption         =   "写"
         Height          =   315
         Left            =   3420
         TabIndex        =   68
         Top             =   2610
         Width           =   525
      End
      Begin VB.CommandButton Command18 
         Caption         =   "读"
         Height          =   315
         Left            =   2760
         TabIndex        =   67
         Top             =   2640
         Width           =   525
      End
      Begin VB.CommandButton Command17 
         Caption         =   "写"
         Height          =   315
         Left            =   3420
         TabIndex        =   66
         Top             =   2160
         Width           =   525
      End
      Begin VB.CommandButton Command16 
         Caption         =   "读"
         Height          =   315
         Left            =   2760
         TabIndex        =   65
         Top             =   2160
         Width           =   525
      End
      Begin VB.CommandButton Command15 
         Caption         =   "写"
         Height          =   315
         Left            =   3420
         TabIndex        =   64
         Top             =   1710
         Width           =   525
      End
      Begin VB.CommandButton Command14 
         Caption         =   "读"
         Height          =   315
         Left            =   2760
         TabIndex        =   63
         Top             =   1710
         Width           =   525
      End
      Begin VB.CommandButton Command13 
         Caption         =   "写"
         Height          =   315
         Left            =   3420
         TabIndex        =   62
         Top             =   1260
         Width           =   525
      End
      Begin VB.CommandButton Command12 
         Caption         =   "读"
         Height          =   315
         Left            =   2760
         TabIndex        =   61
         Top             =   1260
         Width           =   525
      End
      Begin VB.CommandButton Command11 
         Caption         =   "写"
         Height          =   315
         Left            =   3420
         TabIndex        =   60
         Top             =   840
         Width           =   525
      End
      Begin VB.CommandButton Command10 
         Caption         =   "读"
         Height          =   315
         Left            =   2760
         TabIndex        =   59
         Top             =   840
         Width           =   525
      End
      Begin VB.CommandButton Command9 
         Caption         =   "写"
         Height          =   315
         Left            =   3420
         TabIndex        =   58
         Top             =   420
         Width           =   525
      End
      Begin VB.CommandButton Command8 
         Caption         =   "读"
         Height          =   315
         Left            =   2760
         TabIndex        =   57
         Top             =   420
         Width           =   525
      End
      Begin VB.Frame Frame3 
         Caption         =   "说明"
         Height          =   2355
         Left            =   4110
         TabIndex        =   49
         Top             =   360
         Width           =   1575
         Begin VB.Label Label15 
            Caption         =   "当该块控制位设为1后将永久锁死该块，块内数据无法更改！！！  设置密码使能位后需要用密码来进行保护读写"
            BeginProperty Font 
               Name            =   "新宋体"
               Size            =   10.5
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   1935
            Left            =   150
            TabIndex        =   50
            Top             =   300
            Width           =   1305
         End
      End
      Begin VB.CommandButton Command6 
         BackColor       =   &H00FFC0C0&
         Caption         =   "读取数据"
         Height          =   465
         Left            =   1200
         MaskColor       =   &H8000000F&
         Style           =   1  'Graphical
         TabIndex        =   48
         Top             =   3630
         Width           =   1005
      End
      Begin VB.CommandButton Command5 
         BackColor       =   &H00FFC0C0&
         Caption         =   "写入数据"
         Height          =   465
         Left            =   2340
         Style           =   1  'Graphical
         TabIndex        =   47
         Top             =   3630
         Width           =   1005
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   7
         Left            =   1860
         TabIndex        =   46
         Top             =   3060
         Width           =   885
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   6
         Left            =   1860
         TabIndex        =   45
         Top             =   2610
         Width           =   885
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   5
         Left            =   1860
         TabIndex        =   44
         Top             =   2160
         Width           =   885
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   4
         Left            =   1860
         TabIndex        =   43
         Top             =   1740
         Width           =   885
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   3
         Left            =   1860
         TabIndex        =   42
         Top             =   1320
         Width           =   885
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   2
         Left            =   1860
         TabIndex        =   41
         Top             =   870
         Width           =   885
      End
      Begin VB.CheckBox Check9 
         Caption         =   "控制位"
         Height          =   255
         Index           =   1
         Left            =   1860
         TabIndex        =   40
         Top             =   480
         Width           =   885
      End
      Begin VB.TextBox Text9 
         BackColor       =   &H00FFC0FF&
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   810
         TabIndex        =   39
         Text            =   "00000000"
         Top             =   3060
         Width           =   945
      End
      Begin VB.TextBox Text8 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   810
         TabIndex        =   37
         Text            =   "00000000"
         Top             =   2610
         Width           =   945
      End
      Begin VB.TextBox Text7 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   810
         TabIndex        =   35
         Text            =   "00000000"
         Top             =   2160
         Width           =   945
      End
      Begin VB.TextBox Text6 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   810
         TabIndex        =   33
         Text            =   "00000000"
         Top             =   1710
         Width           =   945
      End
      Begin VB.TextBox Text5 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   810
         TabIndex        =   31
         Text            =   "00000000"
         Top             =   1290
         Width           =   945
      End
      Begin VB.TextBox Text4 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   810
         TabIndex        =   29
         Text            =   "00000000"
         Top             =   870
         Width           =   945
      End
      Begin VB.TextBox Text3 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   810
         TabIndex        =   27
         Text            =   "00000000"
         Top             =   450
         Width           =   945
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         Caption         =   "请输入密码："
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   3480
         TabIndex        =   72
         Top             =   3690
         Width           =   1260
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "第7块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   38
         Top             =   3090
         Width           =   525
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "第6块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   36
         Top             =   2640
         Width           =   525
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "第5块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   34
         Top             =   2190
         Width           =   525
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "第4块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   32
         Top             =   1740
         Width           =   525
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "第3块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   30
         Top             =   1320
         Width           =   525
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "第2块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   28
         Top             =   900
         Width           =   525
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "第1块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   150
         TabIndex        =   26
         Top             =   480
         Width           =   525
      End
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H000080FF&
      Caption         =   "写配置块"
      Height          =   345
      Left            =   7890
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   5820
      Width           =   945
   End
   Begin VB.Frame Frame1 
      Caption         =   "配置块"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1905
      Left            =   30
      TabIndex        =   0
      Top             =   4440
      Width           =   10305
      Begin VB.CommandButton Command28 
         BackColor       =   &H00808080&
         Caption         =   "唤醒卡"
         Enabled         =   0   'False
         Height          =   345
         Left            =   6570
         Style           =   1  'Graphical
         TabIndex        =   94
         Top             =   1380
         Width           =   945
      End
      Begin VB.CommandButton Command4 
         Caption         =   "读配置块"
         Height          =   345
         Left            =   9120
         TabIndex        =   24
         Top             =   1380
         Width           =   945
      End
      Begin VB.CommandButton Command2 
         Caption         =   "默认配置密码"
         Height          =   345
         Left            =   3750
         TabIndex        =   22
         Top             =   1380
         Width           =   1245
      End
      Begin VB.CommandButton Command1 
         Caption         =   "恢复默认值"
         Height          =   345
         Left            =   2520
         TabIndex        =   21
         Top             =   1380
         Width           =   1065
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H00C0FFC0&
         BeginProperty Font 
            Name            =   "黑体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1500
         TabIndex        =   19
         Text            =   "00000000"
         Top             =   1410
         Width           =   945
      End
      Begin VB.CheckBox Check8 
         Alignment       =   1  'Right Justify
         Caption         =   "复位延时"
         Height          =   405
         Left            =   8730
         TabIndex        =   18
         Top             =   780
         Width           =   1095
      End
      Begin VB.CheckBox Check7 
         Alignment       =   1  'Right Justify
         Caption         =   "Inverse Data"
         Height          =   405
         Left            =   6900
         TabIndex        =   17
         Top             =   780
         Width           =   1425
      End
      Begin VB.CheckBox Check6 
         Alignment       =   1  'Right Justify
         Caption         =   "Fast Write"
         Height          =   405
         Left            =   5460
         TabIndex        =   16
         Top             =   780
         Width           =   1245
      End
      Begin VB.CheckBox Check5 
         Alignment       =   1  'Right Justify
         Caption         =   "终结符"
         Height          =   405
         Left            =   4110
         TabIndex        =   15
         Top             =   780
         Width           =   885
      End
      Begin VB.CheckBox Check4 
         Alignment       =   1  'Right Justify
         Caption         =   "密码使能位"
         Height          =   405
         Left            =   2670
         TabIndex        =   14
         Top             =   780
         Width           =   1305
      End
      Begin VB.ComboBox Combo5 
         Height          =   300
         ItemData        =   "Form1.frx":0D48
         Left            =   1980
         List            =   "Form1.frx":0D64
         TabIndex        =   13
         Top             =   810
         Width           =   525
      End
      Begin VB.CheckBox Check3 
         Alignment       =   1  'Right Justify
         Caption         =   "AOR"
         Height          =   345
         Left            =   240
         TabIndex        =   11
         Top             =   780
         Width           =   645
      End
      Begin VB.ComboBox Combo4 
         Height          =   300
         ItemData        =   "Form1.frx":0D80
         Left            =   9360
         List            =   "Form1.frx":0D90
         TabIndex        =   10
         Top             =   390
         Width           =   765
      End
      Begin VB.CheckBox Check2 
         Alignment       =   1  'Right Justify
         Caption         =   "X-Mode"
         Height          =   345
         Left            =   4380
         TabIndex        =   8
         Top             =   360
         Width           =   885
      End
      Begin VB.ComboBox Combo3 
         Height          =   300
         ItemData        =   "Form1.frx":0DAB
         Left            =   6660
         List            =   "Form1.frx":0DD0
         TabIndex        =   7
         Text            =   "00000"
         Top             =   420
         Width           =   1485
      End
      Begin VB.ComboBox Combo2 
         Height          =   300
         ItemData        =   "Form1.frx":0E2C
         Left            =   3330
         List            =   "Form1.frx":0E48
         TabIndex        =   5
         Text            =   "RF/64"
         Top             =   390
         Width           =   885
      End
      Begin VB.ComboBox Combo1 
         Height          =   300
         ItemData        =   "Form1.frx":0E85
         Left            =   1980
         List            =   "Form1.frx":0E92
         TabIndex        =   2
         Text            =   "0"
         Top             =   390
         Width           =   525
      End
      Begin VB.CheckBox Check1 
         Alignment       =   1  'Right Justify
         Caption         =   "Lock"
         Height          =   405
         Left            =   150
         TabIndex        =   1
         Top             =   330
         Width           =   735
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "配置块（块0）"
         BeginProperty Font 
            Name            =   "黑体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   120
         TabIndex        =   20
         Top             =   1440
         Width           =   1365
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "最大块"
         Height          =   180
         Left            =   1350
         TabIndex        =   12
         Top             =   900
         Width           =   540
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "PSK-CF"
         Height          =   180
         Left            =   8730
         TabIndex        =   9
         Top             =   450
         Width           =   540
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "调制模式"
         Height          =   180
         Left            =   5760
         TabIndex        =   6
         Top             =   450
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "数据率"
         Height          =   180
         Left            =   2700
         TabIndex        =   4
         Top             =   450
         Width           =   540
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Safer Key"
         Height          =   180
         Left            =   1080
         TabIndex        =   3
         Top             =   450
         Width           =   810
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim UserBuff(1024) As Byte
Dim UserRxdBuff(1024) As Byte


Dim ReturnData(1) As Byte
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Public Function IsHex(c As String) As Integer
If c >= "0" And c <= "9" Then
  IsHex = Val(c) - Val("0")
ElseIf c >= "a" And c <= "f" Then
  IsHex = Asc(c) - Asc("a") + 10
ElseIf c >= "A" And c <= "F" Then
  IsHex = Asc(c) - Asc("A") + 10
Else
  IsHex = 16
End If
End Function

Function CRC16(data() As Byte, L As Integer) As String
    Dim CRC16Lo As Byte, CRC16Hi As Byte      'CRC寄存器
    Dim CL As Byte, CH As Byte                '多项式码&HA001
    Dim SaveHi As Byte, SaveLo As Byte
    Dim i As Integer
    Dim Flag As Integer
    
    CRC16Lo = &HFF
    CRC16Hi = &HFF
    
    CL = &H1
    CH = &HA0
    
    For i = 0 To L
        CRC16Lo = CRC16Lo Xor data(i)        '每一个数据与CRC寄存器进行异或
        For Flag = 0 To 7
            SaveHi = CRC16Hi
            SaveLo = CRC16Lo
            CRC16Hi = CRC16Hi \ 2            '高位右移一位
            CRC16Lo = CRC16Lo \ 2            '低位右移一位
            If ((SaveHi And &H1) = &H1) Then '如果高位字节最后一位为1
                CRC16Lo = CRC16Lo Or &H80      '则低位字节右移后前面补1
            End If                           '否则自动补0
            If ((SaveLo And &H1) = &H1) Then '如果LSB为1，则与多项式码进行异或
                CRC16Hi = CRC16Hi Xor CH
                CRC16Lo = CRC16Lo Xor CL
            End If
        Next Flag
    Next i
    ReturnData(0) = CRC16Hi              'CRC高位
    ReturnData(1) = CRC16Lo              'CRC低位
    
End Function

Private Sub Bank0Data()

    Dim Bank0_data(4) As Byte
    
    Bank0_data(0) = 0
    Bank0_data(1) = 0
    Bank0_data(2) = 0
    Bank0_data(3) = 0
    
    Select Case Val(Combo1.ListIndex)
        Case 0
            Bank0_data(0) = 0
        Case 1
            Bank0_data(0) = &H60
        Case 2
            Bank0_data(0) = &H90
    End Select
    
    Select Case Val(Combo2.ListIndex)
        Case 0
            Bank0_data(1) = 0
        Case 1
            Bank0_data(1) = &H4
        Case 2
            Bank0_data(1) = &H8
        Case 3
            Bank0_data(1) = &HC
        Case 4
            Bank0_data(1) = &H10
        Case 5
            Bank0_data(1) = &H14
        Case 6
            Bank0_data(1) = &H18
        Case 7
            Bank0_data(1) = &H1C
    End Select
    
    If Check2.Value = 1 Then
       Bank0_data(1) = Bank0_data(1) Or &H2
    End If
    
    Select Case Val(Combo3.ListIndex)
        Case 0
            Bank0_data(2) = 0
        Case 1
            Bank0_data(2) = &H10
        Case 2
            Bank0_data(2) = &H20
        Case 3
            Bank0_data(2) = &H30
        Case 4
            Bank0_data(2) = &H40
        Case 5
            Bank0_data(2) = &H50
        Case 6
            Bank0_data(2) = &H60
        Case 7
            Bank0_data(2) = &H70
        Case 8
            Bank0_data(2) = &H80
        Case 9
            Bank0_data(1) = Bank0_data(1) Or &H1
        Case 10
            Bank0_data(1) = Bank0_data(1) Or &H1
            Bank0_data(2) = &H80
    End Select
    
    Select Case Val(Combo4.ListIndex)
        Case 0
            Bank0_data(2) = Bank0_data(2) And &HF3
        Case 1
            Bank0_data(2) = Bank0_data(2) Or &H4
        Case 2
            Bank0_data(2) = Bank0_data(2) Or &H8
        Case 3
            Bank0_data(2) = Bank0_data(2) Or &HC
    End Select
    
    If Check3.Value = 1 Then
       Bank0_data(2) = Bank0_data(2) Or &H2
    End If
    
    Select Case Val(Combo5.ListIndex)
        Case 0
            Bank0_data(3) = 0
        Case 1
            Bank0_data(3) = &H20
        Case 2
            Bank0_data(3) = &H40
        Case 3
            Bank0_data(3) = &H60
        Case 4
            Bank0_data(3) = &H80
        Case 5
            Bank0_data(3) = &HA0
        Case 6
            Bank0_data(3) = &HC0
        Case 7
            Bank0_data(3) = &HE0
    End Select
    If Check4.Value = 1 Then
       Bank0_data(3) = Bank0_data(3) Or &H10
    End If
    If Check5.Value = 1 Then
       Bank0_data(3) = Bank0_data(3) Or &H8
    End If
    If Check6.Value = 1 Then
       Bank0_data(3) = Bank0_data(3) Or &H4
    End If
    If Check7.Value = 1 Then
       Bank0_data(3) = Bank0_data(3) Or &H2
    End If
    If Check8.Value = 1 Then
       Bank0_data(3) = Bank0_data(3) Or &H1
    End If
    Text1.Text = Right("0" + Hex(Bank0_data(0)), 2) '十六进制收数
    Text1.Text = Text1.Text & Right("0" + Hex(Bank0_data(1)), 2)  '十六进制收数
    Text1.Text = Text1.Text & Right("0" + Hex(Bank0_data(2)), 2)  '十六进制收数
    Text1.Text = Text1.Text & Right("0" + Hex(Bank0_data(3)), 2) '十六进制收数
   
End Sub

Private Sub Check1_Click()
      If Check1.Value = 1 Then
            Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
            Style = vbOKCancel                 ' 定义按钮+ vbCritical
            Title = "警告"                           ' 定义标题文本
            Help = "DEMO.HLP"                        ' 定义帮助文件
            Ctxt = 1000                              ' 定义帮助主题
            Response = MsgBox(Msg, Style, Title, Help, Ctxt)
            If Response = vbCancel Then
                Check1.Value = 0
            End If
      End If
End Sub

Private Sub Check10_Click()
    If Check10.Value = 1 Then
        Text12.Enabled = True
        Command21.Caption = "修改密码"
        Command28.Enabled = True
    Else
        Text12.Enabled = False
        Command21.Caption = "写"
        Command28.Enabled = False
    End If
End Sub

Private Sub Check2_Click()
    Call Bank0Data
End Sub

Private Sub Check3_Click()
    Call Bank0Data
End Sub

Private Sub Check4_Click()
     Call Bank0Data
End Sub

Private Sub Check5_Click()
     Call Bank0Data
End Sub

Private Sub Check6_Click()
     Call Bank0Data
End Sub

Private Sub Check7_Click()
    Call Bank0Data
End Sub

Private Sub Check8_Click()
     Call Bank0Data
End Sub

Private Sub Check9_Click(Index As Integer)
 
    Dim Msg, Style, Title, Help, Ctxt, Response
    
    If Check9(1).Value = 1 Then
        Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
        Style = vbOKCancel                  ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
        If Response = vbCancel Then
            Check9(1).Value = 0
        End If
    End If
    
    If Check9(2).Value = 1 Then
        Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
        Style = vbOKCancel                 ' 定义按钮+ vbCritical
            Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
        If Response = vbCancel Then
            Check9(2).Value = 0
        End If
    End If
    
    If Check9(3).Value = 1 Then
        Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
        Style = vbOKCancel                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
        If Response = vbCancel Then
            Check9(3).Value = 0
        End If
    End If
    If Check9(4).Value = 1 Then
        Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
        Style = vbOKCancel                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
        If Response = vbCancel Then
            Check9(4).Value = 0
        End If
    End If
    If Check9(5).Value = 1 Then
        Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
        Style = vbOKCancel                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
        If Response = vbCancel Then
            Check9(5).Value = 0
        End If
    End If
    
    If Check9(6).Value = 1 Then
        Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
        Style = vbOKCancel                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
        If Response = vbCancel Then
            Check9(6).Value = 0
        End If
    End If
    
    If Check9(7).Value = 1 Then
        Msg = "设置后不可逆,内部数据将锁死！！！"                 '定义消息文本
        Style = vbOKCancel                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
        If Response = vbCancel Then
            Check9(7).Value = 0
        End If
    End If
End Sub


Private Sub Combo1_Click()
    Call Bank0Data
End Sub

Private Sub Combo2_Click()
    Call Bank0Data
    Combo8.ListIndex = Combo2.ListIndex
End Sub

Private Sub Combo3_Click()
    Call Bank0Data
End Sub

Private Sub Combo4_Click()
    Call Bank0Data
End Sub

Private Sub Combo5_Click()
    Call Bank0Data
End Sub

Private Sub Command1_Click()
    Text1.Text = "000880E8"
    Check1.Value = 0
    Combo1.ListIndex = 0
    Combo2.ListIndex = 2
    Check2.Value = 0
    Combo3.ListIndex = 8
    Combo4.ListIndex = 0
    Check3.Value = 0
    Combo5.ListIndex = 7
    Combo8.ListIndex = 2
    Check4.Value = 0
    Check5.Value = 1
    Check6.Value = 0
    Check7.Value = 0
    Check8.Value = 0
End Sub

Private Sub Command10_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text4.Text = "00000000"
        Text4.BackColor = &H80000005
    
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H2               '0页块地址2
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command11_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text4.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H2               '块地址
        UserBuff(4) = Check9(2).Value   '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text4.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command12_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text5.Text = "00000000"
        Text5.BackColor = &H80000005
        
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H3               '0页块地址
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command13_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text5.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H3               '块地址
        UserBuff(4) = Check9(3).Value   '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text5.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command14_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text6.Text = "00000000"
        Text6.BackColor = &H80000005
        
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H4               '0页块地址
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command15_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text6.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H4               '块地址
        UserBuff(4) = Check9(4).Value   '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text6.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command16_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text7.Text = "00000000"
        Text7.BackColor = &H80000005
        
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H5               '0页块地址
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command17_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text7.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H5               '块地址
        UserBuff(4) = Check9(5).Value   '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text7.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command18_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text8.Text = "00000000"
        Text8.BackColor = &H80000005
        
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H6               '0页块地址
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command19_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text8.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H6               '块地址
        UserBuff(4) = Check9(6).Value   '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text8.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command2_Click()
    Text1.Text = "000880F8"
    Check4.Value = 1
End Sub

Private Sub Command20_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text9.Text = "00000000"
        Text9.BackColor = &H80000005
        
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H7               '0页块地址
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command21_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text9.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H7               '块地址
        UserBuff(4) = Check9(7).Value   '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text9.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command22_Click()

On Error GoTo BLAK
Dim TXD_Buff() As Byte

If Command22.Caption = "打 开" Then
   If MSComm1.PortOpen = True Then
        MSComm1.PortOpen = False
        MSComm1.CommPort = Combo6.ListIndex + 1
         MSComm1.PortOpen = True
        Command22.Caption = "关 闭"
        Shape1.BackColor = RGB(0, 255, 0)
  Else
        MSComm1.CommPort = Combo6.ListIndex + 1
        MSComm1.PortOpen = True
        Command22.Caption = "关 闭"
        Shape1.BackColor = RGB(0, 255, 0)
        
        UserBuff(0) = &HAA       '数据头
        UserBuff(1) = &HFF       '握手
        UserBuff(2) = &HFF       '握手
        Call CRC16(UserBuff(), 2)
        UserBuff(3) = ReturnData(0)
        UserBuff(4) = ReturnData(1)
        UserBuff(5) = &HEE
        
        ReDim TXD_Buff(5)
        For L = 0 To 5
                TXD_Buff(L) = UserBuff(L)
        Next L
        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
  End If
  
  Exit Sub
BLAK:
    MsgBox "串口不存在或被占用！", vbOKOnly, "提示信息"
Else
  Command22.Caption = "打 开"
  Shape1.BackColor = RGB(255, 0, 0)
  MSComm1.PortOpen = False
End If

End Sub

Private Sub Command23_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text13.Text = "0000000000"
        Text13.BackColor = &H80000005
        
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF3        '读4100卡
        cnt = 1
        
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command24_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF4        '复制EM4100
        
        If Combo7.ListIndex = 0 Then
            UserBuff(2) = &H0                     '基卡57卡
        Else
            UserBuff(2) = &H1                     '基卡43卡
        End If
        cnt = 2
        
        s = Trim(Text13.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command25_Click()
    If Text14.Text = "" Or Text15.Text = "" Then
        MsgBox "请输入电容和电感值"

    Else
        If (Text14.Text > 0) And (Text15.Text > 0) Then
            Text16.Text = 1000000 / (2 * 3.1415926 * Sqr(Text14.Text * Text15.Text))
            Text16.Text = Left(Text16.Text, 5)
        End If
    End If
End Sub

Private Sub Command26_Click()

    If Text15.Text = "" Or Text16.Text = "" Then
        MsgBox "请输入电感和频率值"
        
    Else
        If (Text15.Text > 0) And (Text16.Text > 0) Then
            Text14.Text = 100000000 / ((Text16.Text * Text16.Text / 10000) * 4 * 3.1415926 * 3.1415926 * Text15.Text)
            Text14.Text = Left(Text14.Text, 5)
        End If
    End If
 
End Sub

Private Sub Command27_Click()
    If Text14.Text = "" Or Text16.Text = "" Then
        MsgBox "请输入电容和频率值"
        
    Else
        If (Text14.Text > 0) And (Text16.Text > 0) Then
            Text15.Text = 1000000000000# / (Text16.Text * Text16.Text * 4 * 3.1415926 * 3.1415926 * Text14.Text)
            Text15.Text = Left(Text15.Text, 5)
        End If
    End If
End Sub

Private Sub Command28_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF2        '唤醒
        cnt = 1
        
        s = Trim(Text12.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub


Private Sub Command29_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text10.BackColor = &H80000005
        Text11.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H16              '第一页 块地址 1 2
        
        UserBuff(4) = 0                 '块锁
        If Check9(0).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H2
        End If
        If Check9(8).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H4
        End If             '块锁
        
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text11.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text10.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command3_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text1.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H0               '块地址
        UserBuff(4) = Check1.Value      '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text1.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
        
        If Check4.Value <> 1 Then
            Check10.Value = 0
        Else
            Check10.Value = 1
        End If
    End If
End Sub

Private Sub Command4_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text1.Text = "00000000"
        Text1.BackColor = &H80000005
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H0               '0页块地址
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command5_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text3.BackColor = &H80000005
        Text4.BackColor = &H80000005
        Text5.BackColor = &H80000005
        Text6.BackColor = &H80000005
        Text7.BackColor = &H80000005
        Text8.BackColor = &H80000005
        If Check10.Value = 0 Then
            Text9.BackColor = &H80000005
        End If
        
        UserBuff(0) = &HAA              '数据头
        UserBuff(1) = &HF1              '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        
        UserBuff(3) = &HF               '块地址  不写块0
        UserBuff(4) = 0                 '块锁
        If Check9(1).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H2
        End If
        If Check9(2).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H4
        End If
        If Check9(3).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H8
        End If
        If Check9(4).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H10
        End If
        If Check9(5).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H20
        End If
        If Check9(6).Value = 1 Then              '锁
            UserBuff(4) = UserBuff(4) Or &H40
        End If
        If Check10.Value <> 1 Then
            If Check9(7).Value = 1 Then          '锁
                UserBuff(4) = UserBuff(4) Or &H80
            End If
        End If
        
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
    
        s = Trim(Text12.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text3.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        s = Trim(Text4.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text5.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        s = Trim(Text6.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        s = Trim(Text7.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        s = Trim(Text8.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        If Check10.Value <> 1 Then
            s = Trim(Text9.Text)
            L = Len(s)
            Do While (L)
                Do Until IsHex(Left(s, 1)) <> 16
                L = L - 1
                If L = 0 Then Exit Do
                s = Right(s, L)
                Loop
                a = IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
                If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                    a = a * 16 + IsHex(Left(s, 1))
                    L = L - 1
                    s = Right(s, L)
                End If
                cnt = cnt + 1
                UserBuff(cnt) = a
            Loop
        End If
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command6_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text3.Text = "00000000"
        Text4.Text = "00000000"
        Text5.Text = "00000000"
        Text6.Text = "00000000"
        Text7.Text = "00000000"
        Text8.Text = "00000000"
        Text9.Text = "00000000"
        Text3.BackColor = &H80000005
        Text4.BackColor = &H80000005
        Text5.BackColor = &H80000005
        Text6.BackColor = &H80000005
        Text7.BackColor = &H80000005
        Text8.BackColor = &H80000005
        Text9.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF0        '读
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &HF               '读0页所有块
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)       '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command7_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text10.Text = "00000000"
        Text10.BackColor = &H80000005
        Text11.Text = "00000000"
        Text11.BackColor = &H80000005
        
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF0        '读
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H16              '0页块地址 读块 1 2
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
                
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command8_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text3.Text = "00000000"
        Text3.BackColor = &H80000005
        
        UserBuff(0) = &HAA      '数据头
        UserBuff(1) = &HF0      '读
        
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H1               '0页块地址
        UserBuff(4) = Check10.Value     '密码使能位 保护读
        cnt = 4
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        Call CRC16(UserBuff(), cnt)
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff             '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Command9_Click()
    Dim Msg, Style, Title, Help, Ctxt, Response
    Dim s As String
    Dim L As Integer
    Dim cnt As Integer
    Dim TXD_Buff() As Byte
    
    If (MSComm1.PortOpen = False) = True Then    '判断串口是否打
        Msg = "请打开串口！！！"                 '定义消息文本
        Style = vbDefaultButton2                 ' 定义按钮+ vbCritical
        Title = "警告"                           ' 定义标题文本
        Help = "DEMO.HLP"                        ' 定义帮助文件
        Ctxt = 1000                              ' 定义帮助主题
        Response = MsgBox(Msg, Style, Title, Help, Ctxt)
    Else
        Text3.BackColor = &H80000005
        UserBuff(0) = &HAA        '数据头
        UserBuff(1) = &HF1        '写
        Select Case Val(Combo8.ListIndex)   '读卡速率
            Case 0
                UserBuff(2) = &H8       '8rf
            Case 1
                UserBuff(2) = &H10      '16rf
            Case 2
                UserBuff(2) = &H20      '32rf
            Case 3
                UserBuff(2) = &H28      '40rf
            Case 4
                UserBuff(2) = &H32      '50rf
            Case 5
                UserBuff(2) = &H40      '64rf
            Case 6
                UserBuff(2) = &H64      '100rf
            Case 7
                UserBuff(2) = &H80      '128rf
        End Select
        UserBuff(3) = &H1               '块地址
        UserBuff(4) = Check9(1).Value   '块锁
        UserBuff(5) = Check10.Value     '密码使能位 保护写
        cnt = 5
        
        s = Trim(Text12.Text)           '密码数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        s = Trim(Text3.Text)            '写入数据
        L = Len(s)
        Do While (L)
            Do Until IsHex(Left(s, 1)) <> 16
            L = L - 1
            If L = 0 Then Exit Do
            s = Right(s, L)
            Loop
            a = IsHex(Left(s, 1))
            L = L - 1
            s = Right(s, L)
            If L <> 0 And IsHex(Left(s, 1)) <> 16 Then
                a = a * 16 + IsHex(Left(s, 1))
                L = L - 1
                s = Right(s, L)
            End If
            cnt = cnt + 1
            UserBuff(cnt) = a
        Loop
        
        Call CRC16(UserBuff(), cnt)
        
        UserBuff(cnt + 1) = ReturnData(0)
        UserBuff(cnt + 2) = ReturnData(1)
        UserBuff(cnt + 3) = &HEE
        ReDim TXD_Buff(cnt + 3)
        
        For L = 0 To cnt + 3
            TXD_Buff(L) = UserBuff(L)
        Next L

        If (MSComm1.PortOpen = True) = True Then  '判断串口是否打开
            MSComm1.Output = TXD_Buff              '串口打开时将数据发送出去
        End If
    End If
End Sub

Private Sub Form_Load()

Dim i As Byte
Dim j As Byte

Text1.Text = "000880E8"
Check1.Value = 0
Combo1.ListIndex = 0
Combo2.ListIndex = 2
Check2.Value = 0
Combo3.ListIndex = 8
Combo4.ListIndex = 0
Check3.Value = 0
Combo5.ListIndex = 7
Check4.Value = 0
Check5.Value = 1
Check6.Value = 0
Check7.Value = 0
Check8.Value = 0
Combo7.ListIndex = 0
Text1.Enabled = False
Text12.Enabled = False

'For i = 1 To 100
'      Combo6.AddItem "COM" & i
'Next i
j = 0
With frmPort1

    If MSComm1.PortOpen = True Then
        MSComm1.PortOpen = False
    End If


    For i = 1 To 100
        On Error Resume Next '当运行发生错误时，控件转到紧接着发生错误的语句之后的语句，并在此继续运行
        MSComm1.CommPort = i
        MSComm1.PortOpen = True
        
        Select Case Err.Number
             Case 0                       '错误号为0(也就是没出错),
                    Combo6.ListIndex = i - 1
                    If j = 0 Then
                        j = i - 1
                    End If
                    MSComm1.PortOpen = False
                    Combo6.AddItem "COM" & Trim(i) & "  可用"
             Case 8005                    '错误号为8005,也就是端口被占用
                    Combo6.AddItem "COM" & Trim(i) & " 已经占用"
                    MSComm1.PortOpen = False
             Case Else
                    Combo6.AddItem "COM" & i
        End Select
        Err = 0               '将错误号置0. 注:Err.Number可以简写为Err ,2者等效
    Next
    Combo6.ListIndex = j
End With

End Sub

Private Sub ReadBank0_data()          '帧处理

    UserRxdBuff(4) = UserRxdBuff(4) And &HF0
    Select Case Val(UserRxdBuff(4))       'Safer key
        Case &H0
                Combo1.ListIndex = 0
        Case &H60
                Combo1.ListIndex = 1
        Case &H90
                Combo1.ListIndex = 2
    End Select
    
    UserRxdBuff(4) = UserRxdBuff(5) And &H1C
    Select Case Val(UserRxdBuff(4))       '数据率
        Case &H0
                Combo2.ListIndex = 0
        Case &H4
                Combo2.ListIndex = 1
        Case &H8
                Combo2.ListIndex = 2
        Case &HC
                Combo2.ListIndex = 3
        Case &H10
                Combo2.ListIndex = 4
        Case &H14
                Combo2.ListIndex = 5
        Case &H18
                Combo2.ListIndex = 6
        Case &H1C
                Combo2.ListIndex = 7
    End Select
    
    If (UserRxdBuff(5) And &H2) <> 0 Then 'X-mode
        Check2.Value = 1
    Else
        Check2.Value = 0
    End If
    
    UserRxdBuff(4) = UserRxdBuff(6) And &HF0
    If (UserRxdBuff(5) And &H1) = 0 Then   '调制模式
        Select Case Val(UserRxdBuff(4))
            Case &H0
                    Combo3.ListIndex = 0
            Case &H10
                    Combo3.ListIndex = 1
            Case &H20
                    Combo3.ListIndex = 2
            Case &H30
                    Combo3.ListIndex = 3
            Case &H40
                    Combo3.ListIndex = 4
            Case &H50
                    Combo3.ListIndex = 5
            Case &H60
                    Combo3.ListIndex = 6
            Case &H70
                    Combo3.ListIndex = 7
            Case &H80
                    Combo3.ListIndex = 8
        End Select
     Else
        Select Case Val(UserRxdBuff(4))
            Case &H0
                    Combo3.ListIndex = 9
            Case &H80
                    Combo3.ListIndex = 10
        End Select
    End If
    
    UserRxdBuff(4) = UserRxdBuff(6) And &HC
        Select Case Val(UserRxdBuff(4))     'PSK-CF
            Case &H0
                    Combo4.ListIndex = 0
            Case &H4
                    Combo4.ListIndex = 1
            Case &H8
                    Combo4.ListIndex = 2
            Case &HC
                    Combo4.ListIndex = 3
        End Select
        
    If (UserRxdBuff(6) And &H2) <> 0 Then   'AOR
        Check3.Value = 1
    Else
        Check3.Value = 0
    End If
    
    UserRxdBuff(4) = UserRxdBuff(7) And &HE0    '最大块
    Select Case Val(UserRxdBuff(4))
        Case &H0
                Combo5.ListIndex = 0
        Case &H20
                Combo5.ListIndex = 1
        Case &H40
                Combo5.ListIndex = 2
        Case &H60
                Combo5.ListIndex = 3
        Case &H80
                Combo5.ListIndex = 4
        Case &HA0
                Combo5.ListIndex = 5
        Case &HC0
                Combo5.ListIndex = 6
        Case &HE0
                Combo5.ListIndex = 7
    End Select
    
    If (UserRxdBuff(7) And &H10) <> 0 Then '密码使能位
        Check4.Value = 1
    Else
        Check4.Value = 0
    End If
                
    If (UserRxdBuff(7) And &H8) <> 0 Then  '终结符
        Check5.Value = 1
    Else
        Check5.Value = 0
    End If
    
    If (UserRxdBuff(7) And &H4) <> 0 Then  'Fast write
        Check6.Value = 1
    Else
        Check6.Value = 0
    End If
    
    If (UserRxdBuff(7) And &H2) <> 0 Then  'Inverse Dat
        Check7.Value = 1
    Else
        Check7.Value = 0
    End If
    
    If (UserRxdBuff(7) And &H1) <> 0 Then  '复位延时
        Check8.Value = 1
    Else
        Check8.Value = 0
    End If
End Sub

Private Sub MSComm1_OnComm()

    Dim getBytes() As Byte           '用来从接收缓冲区读取数据
    Dim getLen As Integer
    Dim tmpi As Integer
    Dim i As Integer
    
    Select Case MSComm1.CommEvent
        Case comEvReceive
                MSComm1.RThreshold = 0   '关闭接收中断
                Sleep 100                '阻塞，等待接收完成
                MSComm1.RThreshold = 1
                getLen = MSComm1.InBufferCount '获取接收缓存的数据长度
                getBytes = MSComm1.Input       '取接收到的数据
                For tmpi = 0 To getLen - 1     '取接收到缓存数组
                    UserRxdBuff(tmpi) = getBytes(tmpi)
                Next tmpi
               
                
                If UserRxdBuff(0) = &HAA And UserRxdBuff(getLen - 1) = &HEE Then '判断数据头尾
                    Call CRC16(UserRxdBuff(), getLen - 4)            '计算CRC
                    If UserRxdBuff(getLen - 2) = ReturnData(0) And UserRxdBuff(getLen - 3) = ReturnData(1) Then   '判断CRC
                        Select Case UserRxdBuff(1)
                                Case &HF0         '读0页返回的数据
                                        If UserRxdBuff(2) = 1 Then  '成功
                                            Select Case UserRxdBuff(3)   '地址
                                                    Case &H0    '扇区0
                                                        Text1.BackColor = &HC0FFC0
                                                        Text1.Text = ""
                                                        For i = 0 To 3
                                                            Text1.Text = Text1.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区0
                                                        Next i
                                                        Call ReadBank0_data
                                                    Case &H1    '扇区1
                                                        Text3.Text = ""
                                                        For i = 0 To 3
                                                            Text3.Text = Text3.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        Text3.BackColor = RGB(0, 255, 0)
                                                    Case &H2    '扇区2
                                                        Text4.Text = ""
                                                        For i = 0 To 3
                                                            Text4.Text = Text4.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        Text4.BackColor = RGB(0, 255, 0)
                                                    Case &H3    '扇区3
                                                        Text5.Text = ""
                                                        For i = 0 To 3
                                                            Text5.Text = Text5.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        Text5.BackColor = RGB(0, 255, 0)
                                                    Case &H4    '扇区4
                                                        Text6.Text = ""
                                                        For i = 0 To 3
                                                            Text6.Text = Text6.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        Text6.BackColor = RGB(0, 255, 0)
                                                    Case &H5    '扇区5
                                                        Text7.Text = ""
                                                        For i = 0 To 3
                                                            Text7.Text = Text7.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        Text7.BackColor = RGB(0, 255, 0)
                                                    Case &H6    '扇区6
                                                        Text8.Text = ""
                                                        For i = 0 To 3
                                                            Text8.Text = Text8.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        Text8.BackColor = RGB(0, 255, 0)
                                                    Case &H7    '扇区7
                                                        Text9.Text = ""
                                                        For i = 0 To 3
                                                            Text9.Text = Text9.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        Text9.BackColor = &HFFC0FF
                                                    Case &HF   '扇区 1 2 3 4 5 6 7
                                                        Text3.BackColor = RGB(0, 255, 0)
                                                        Text4.BackColor = RGB(0, 255, 0)
                                                        Text5.BackColor = RGB(0, 255, 0)
                                                        Text6.BackColor = RGB(0, 255, 0)
                                                        Text7.BackColor = RGB(0, 255, 0)
                                                        Text8.BackColor = RGB(0, 255, 0)
                                                        Text9.BackColor = &HFFC0FF
                                                        Text3.Text = ""
                                                        Text4.Text = ""
                                                        Text5.Text = ""
                                                        Text6.Text = ""
                                                        Text7.Text = ""
                                                        Text8.Text = ""
                                                        Text9.Text = ""
                                                        For i = 0 To 3
                                                            Text3.Text = Text3.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        For i = 0 To 3
                                                            Text4.Text = Text4.Text & Right("0" + Hex(UserRxdBuff(i + 8)), 2)   '扇区2
                                                        Next i
                                                        For i = 0 To 3
                                                            Text5.Text = Text5.Text & Right("0" + Hex(UserRxdBuff(i + 12)), 2)   '扇区3
                                                        Next i
                                                        For i = 0 To 3
                                                            Text6.Text = Text6.Text & Right("0" + Hex(UserRxdBuff(i + 16)), 2)   '扇区4
                                                        Next i
                                                        For i = 0 To 3
                                                            Text7.Text = Text7.Text & Right("0" + Hex(UserRxdBuff(i + 20)), 2)   '扇区5
                                                        Next i
                                                        For i = 0 To 3
                                                            Text8.Text = Text8.Text & Right("0" + Hex(UserRxdBuff(i + 24)), 2)   '扇区6
                                                        Next i
                                                        For i = 0 To 3
                                                            Text9.Text = Text9.Text & Right("0" + Hex(UserRxdBuff(i + 28)), 2)   '扇区7
                                                        Next i
                                                    Case &H12            '读1页 扇区1返回的数据
                                                        Text11.Text = ""
                                                        Text11.BackColor = RGB(0, 255, 0)
                                                        For i = 0 To 3
                                                            Text11.Text = Text11.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                    Case &H14            '读1页 扇区2返回的数据
                                                        Text10.Text = ""
                                                        Text10.BackColor = RGB(0, 255, 0)
                                                        For i = 0 To 3
                                                            Text10.Text = Text10.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区2
                                                        Next i
                                                    Case &H16            '读1页 扇区1 + 2返回的数据
                                                        Text10.Text = ""
                                                        Text11.Text = ""
                                                        Text10.BackColor = RGB(0, 255, 0)
                                                        Text11.BackColor = RGB(0, 255, 0)
                                                        For i = 0 To 3
                                                            Text11.Text = Text11.Text & Right("0" + Hex(UserRxdBuff(i + 4)), 2)   '扇区1
                                                        Next i
                                                        For i = 0 To 3
                                                            Text10.Text = Text10.Text & Right("0" + Hex(UserRxdBuff(i + 8)), 2)   '扇区2
                                                        Next i
                                                    
                                            End Select
                                        Else    '失败
                                            Select Case UserRxdBuff(3)   '地址
                                                    Case &H0    '扇区0
                                                            Text1.BackColor = &HC0C0FF
                                                    Case &H1    '扇区1
                                                            Text3.Text = "00000000"      '扇区1
                                                            Text3.BackColor = &HC0C0FF
                                                    Case &H2    '扇区2
                                                            Text4.Text = "00000000"      '扇区2
                                                            Text4.BackColor = &HC0C0FF
                                                    Case &H3    '扇区3
                                                            Text5.Text = "00000000"      '扇区3
                                                            Text5.BackColor = &HC0C0FF
                                                    Case &H4    '扇区4
                                                            Text6.Text = "00000000"      '扇区4
                                                            Text6.BackColor = &HC0C0FF
                                                    Case &H5    '扇区5
                                                            Text7.Text = "00000000"      '扇区5
                                                            Text7.BackColor = &HC0C0FF
                                                    Case &H6    '扇区6
                                                            Text8.Text = "00000000"      '扇区6
                                                            Text8.BackColor = &HC0C0FF
                                                    Case &H7    '扇区7
                                                            Text9.Text = "00000000"      '扇区7
                                                            Text9.BackColor = &HC0C0FF
                                                    Case &HF    '扇区 1 2 3 4 5 6 7
                                                            Text3.Text = "00000000"      '扇区1
                                                            Text4.Text = "00000000"      '扇区2
                                                            Text5.Text = "00000000"      '扇区3
                                                            Text6.Text = "00000000"      '扇区4
                                                            Text7.Text = "00000000"      '扇区5
                                                            Text8.Text = "00000000"      '扇区6
                                                            Text7.Text = "00000000"      '扇区7
                                                            Text1.BackColor = &HC0C0FF
                                                            Text3.BackColor = &HC0C0FF
                                                            Text4.BackColor = &HC0C0FF
                                                            Text5.BackColor = &HC0C0FF
                                                            Text6.BackColor = &HC0C0FF
                                                            Text7.BackColor = &HC0C0FF
                                                            Text8.BackColor = &HC0C0FF
                                                            Text9.BackColor = &HC0C0FF
                                                    Case &H12
                                                            Text11.Text = "00000000"      '读1页扇区1
                                                            Text11.BackColor = &HC0C0FF
                                                    Case &H14
                                                            Text11.Text = "00000000"      '读1页扇区1
                                                            Text11.BackColor = &HC0C0FF
                                                    Case &H16
                                                            Text10.Text = "00000000"      '读1页扇区1
                                                            Text10.BackColor = &HC0C0FF
                                                            Text11.Text = "00000000"      '读1页扇区2
                                                            Text11.BackColor = &HC0C0FF
                                            End Select
                                        End If

                                Case &HF1         '写返回的数据
                                        If UserRxdBuff(2) = 1 Then  '成功
                                            Select Case UserRxdBuff(3)   '地址
                                                    Case &H0    '扇区0
                                                            Text1.BackColor = &HC0FFC0
                                                    Case &H1    '扇区1
                                                            Text3.BackColor = RGB(0, 255, 0)   '扇区1
                                                    Case &H2    '扇区2
                                                            Text4.BackColor = RGB(0, 255, 0)  '扇区2
                                                    Case &H3    '扇区3
                                                            Text5.BackColor = RGB(0, 255, 0)
                                                    Case &H4    '扇区4
                                                            Text6.BackColor = RGB(0, 255, 0)
                                                    Case &H5    '扇区5
                                                            Text7.BackColor = RGB(0, 255, 0)
                                                    Case &H6    '扇区6
                                                            Text8.BackColor = RGB(0, 255, 0)
                                                    Case &H7    '扇区7
                                                            Text9.BackColor = &HFFC0FF
                                                            If Check10.Value = 1 Then
                                                                Text12.Text = Text9.Text
                                                            End If
                                                    Case &H12
                                                            Text11.BackColor = RGB(0, 255, 0)   '1页扇区1
                                                    Case &H14
                                                            Text10.BackColor = RGB(0, 255, 0)   '1页扇区2
                                                    Case &H16
                                                            Text10.BackColor = RGB(0, 255, 0)   '1页扇区1
                                                            Text11.BackColor = RGB(0, 255, 0)   '1页扇区2
                                            End Select
                                        Else
                                            Select Case UserRxdBuff(3)   '地址
                                                    Case &H0    '扇区0
                                                            Text1.BackColor = &HC0C0FF
                                                    Case &H1    '扇区1
                                                            Text3.BackColor = &HC0C0FF   '扇区1
                                                    Case &H2    '扇区2
                                                            Text4.BackColor = &HC0C0FF   '扇区2
                                                    Case &H3    '扇区3
                                                            Text5.BackColor = &HC0C0FF
                                                    Case &H4    '扇区4
                                                            Text6.BackColor = &HC0C0FF
                                                    Case &H5    '扇区5
                                                            Text7.BackColor = &HC0C0FF
                                                    Case &H6    '扇区6
                                                            Text8.BackColor = &HC0C0FF
                                                    Case &H7    '扇区7
                                                            Text9.BackColor = &HC0C0FF
                                                    Case &H12
                                                            Text11.BackColor = &HC0C0FF   '1页扇区1
                                                    Case &H14
                                                            Text10.BackColor = &HC0C0FF   '1页扇区2
                                                    Case &H16
                                                            Text10.BackColor = &HC0C0FF   '1页扇区1
                                                            Text11.BackColor = &HC0C0FF   '1页扇区2
                                            End Select
                                        End If
                                        
                                Case &HF2         '唤醒返回的数据
                                Case &HF3         '读EM4100返回的数据
                                      If UserRxdBuff(2) = 1 Then  '成功
                                            Text13.BackColor = RGB(0, 255, 0)
                                            Text13.Text = ""
                                            For i = 0 To 4
                                                Text13.Text = Text13.Text & Right("0" + Hex(UserRxdBuff(i + 3)), 2)   '扇区2
                                            Next i
                                      Else
                                            Text13.Text = "0000000000"
                                            Text13.BackColor = &HC0C0FF
                                      End If
                                Case &HF4         '复制EM4100返回的数据
                                      If UserRxdBuff(2) = 1 Then  '成功
                                            Text13.BackColor = RGB(0, 255, 0)
                                      Else
                                            Text13.BackColor = &HC0C0FF
                                      End If
                        End Select
                    End If
                End If
                MSComm1.RThreshold = 1
    End Select
End Sub

Private Sub Text14_Change()
    If Len(Text14.Text) = 6 Then
        Text14.Text = ""
    End If
End Sub
Private Sub Text14_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or KeyAscii = 8 Then
  Else
    KeyAscii = 0
  End If
End Sub

Private Sub Text15_Change()
    If Len(Text15.Text) = 6 Then
        Text15.Text = ""
    End If
End Sub
Private Sub Text15_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or KeyAscii = 8 Then
  Else
    KeyAscii = 0
  End If
End Sub

Private Sub Text16_Change()
    If Len(Text16.Text) = 6 Then
        Text16.Text = ""
    End If
End Sub
Private Sub Text16_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or KeyAscii = 8 Then
  Else
    KeyAscii = 0
  End If
End Sub

Private Sub Text2_Change()
    If Len(Text2.Text) = 9 Then
    Text2.Text = ""
    End If
End Sub
Private Sub Text2_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
  Else
    KeyAscii = 0
  End If
End Sub

Private Sub Text3_Change()
    If Len(Text3.Text) = 9 Then
        Text3.Text = ""
    End If
End Sub
Private Sub Text3_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text4_Change()
    If Len(Text4.Text) = 9 Then
        Text4.Text = ""
    End If
End Sub

Private Sub Text4_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text5_Change()
    If Len(Text5.Text) = 9 Then
        Text5.Text = ""
    End If
End Sub
Private Sub Text5_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text6_Change()
    If Len(Text6.Text) = 9 Then
        Text6.Text = ""
    End If
End Sub
Private Sub Text6_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text7_Change()
    If Len(Text7.Text) = 9 Then
        Text7.Text = ""
    End If
End Sub
Private Sub Text7_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text8_Change()
    If Len(Text8.Text) = 9 Then
        Text8.Text = ""
    End If
End Sub
Private Sub Text8_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text9_Change()
    If Len(Text9.Text) = 9 Then
        Text9.Text = ""
    End If
End Sub
Private Sub Text9_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text10_Change()
    If Len(Text10.Text) = 9 Then
        Text10.Text = ""
    End If
End Sub
Private Sub Text10_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text11_Change()
    If Len(Text11.Text) = 9 Then
        Text11.Text = ""
    End If
End Sub
Private Sub Text11_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text12_Change()
    If Len(Text12.Text) = 9 Then
        Text12.Text = ""
    End If
End Sub
Private Sub Text12_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub
Private Sub Text13_Change()
    If Len(Text13.Text) = 11 Then
        Text13.Text = ""
    End If
End Sub
Private Sub Text13_KeyPress(KeyAscii As Integer)
  Dim temp As String
  If (KeyAscii <= vbKey9 And KeyAscii >= vbKey0) Or (KeyAscii <= 102 And KeyAscii >= 97) Or (KeyAscii <= vbKeyF And KeyAscii >= vbKeyA) Or KeyAscii = 8 Then
     If KeyAscii <= 102 And KeyAscii >= 97 Then
        KeyAscii = KeyAscii - 32
     End If
     Else
      KeyAscii = 0
  End If
End Sub

