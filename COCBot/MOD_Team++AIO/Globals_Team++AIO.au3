; #FUNCTION# ====================================================================================================================
; Name ..........: Globals_Team++AIO
; Description ...: This file Includes several files in the current script and all Declared variables, constant, or create an array.
; Syntax ........: #include , Global
; Parameters ....: None
; Return values .: None
; Author ........: Team++ AIO (2017)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; Check Version
Global $g_sLastModversion = "" ;latest version from GIT
Global $g_sLastModmessage = "" ;message for last version
Global $g_sOldModversmessage = "" ;warning message for old bot

; CSV Command DropS, SideP, Zap, Remain (Mr.Viper) - Added by NguyenAnhHD
Global $CurBaseRedLine[2] = ["", ""]
Global $DCD = "440,70|825,344|440,640|55,344"
Global $ECD = "440,22|860,344|440,670|2,344"

Global $debugDropSCommand = 0, $LocateMode = 1 ; Can be 1 OR 2, CURRENTLY 2 is not completed

Global $PixelEaglePos[2] = [-2, -2] ; -2 Means Not Changed still/First value,  -1 Means Changed But Reseted
Global $PixelInfernoPos[2] = [-2, -2] ; -2 Means Not Changed still/First value,  -1 Means Changed But Reseted
Global $PixelADefensePos[2] = [-2, -2] ; -2 Means Not Changed still/First value,  -1 Means Changed But Reseted
Global $PixelTHPos[2] = [-2, -2] ; -2 Means Not Changed still/First value,  -1 Means Changed But Reseted
Global $storedEaglePos = ""
Global $storedInfernoPos = ""
Global $storedADefensePos = ""
Global $storedTHPos = ""


Global $DebugSideP = 0
Global $dGoldMines = @ScriptDir & "\imgxml\Storages\SideP\GoldMines", $dDarkDrills = @ScriptDir & "\imgxml\Storages\SideP\Drills", $dElixirCollectors = @ScriptDir & "\imgxml\Storages\SideP\Collectors"
Global $allMinesFound[7][3], $allCollectorsFound[7][3], $allDrillsFound[3][3]

; Bot Humanization (Roro-Titi) - Added by NguyenAnhHD
Global $g_iMinimumPriority, $g_iMaxActionsNumber, $g_iActionToDo
Global $g_aSetActionPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $g_sFrequenceChain = GetTranslated(42, 100, "Never|Sometimes|Frequently|Often|Very Often")
Global $g_sReplayChain = "1|2|4"
Global $g_ichkUseBotHumanization, $g_ichkUseAltRClick, $g_icmbMaxActionsNumber, $g_ichkCollectAchievements, $g_ichkLookAtRedNotifications

Global $g_iacmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_iacmbMaxSpeed[2] = [0, 0]
Global $g_iacmbPause[2] = [0, 0]
Global $g_iahumanMessage[2] = ["", ""]

Global $g_acmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_acmbMaxSpeed[2] = [0, 0]
Global $g_acmbPause[2] = [0, 0]
Global $g_ahumanMessage[2] = ["", ""]

Global $g_aReplayDuration[2] = [0, 0] ; An array, [0] = Minute | [1] = Seconds
Global $g_bOnReplayWindow, $g_iReplayToPause

Global $g_iQuickMISX = 0, $g_iQuickMISY = 0
Global $g_iLastLayout = 0

; Goblin XP (Mr.Viper) - Added by NguyenAnhHD
Global $ichkEnableSuperXP = 0, $irbSXTraining = 1, $ichkSXBK = 0, $ichkSXAQ = 0, $ichkSXGW = 0, $iStartXP = 0, $iCurrentXP = 0, $iGainedXP = 0, $iGainedXPHour = 0, $itxtMaxXPtoGain = 500
Global $DebugSX = 0

; Attack Settings [Dec 2016] used on Classic Attack
Global Const $g_aaiTopLeftDropPoints[5][2] = [[62, 306], [156, 238], [221, 188], [288, 142], [383, 76]]
Global Const $g_aaiTopRightDropPoints[5][2] = [[486, 59], [586, 134], [652, 184], [720, 231], [817, 308]]
Global Const $g_aaiBottomLeftDropPoints[5][2] = [[20, 373], [101, 430], [171, 481], [244, 535], [346, 615]]
Global Const $g_aaiBottomRightDropPoints[5][2] = [[530, 615], [632, 535], [704, 481], [781, 430], [848, 373]]
Global Const $g_aaiEdgeDropPoints[4] = [$g_aaiBottomRightDropPoints, $g_aaiTopLeftDropPoints, $g_aaiBottomLeftDropPoints, $g_aaiTopRightDropPoints]

; Auto Hide (NguyenAnhHD) - Added by NguyenAnhHD
Global $ichkAutoHide, $ichkAutoHideDelay = 10

; Check Collector Outside (McSlither) - Added by NguyenAnhHD
#region Check Collectors Outside
; Collectors outside filter
Global $ichkDBMeetCollOutside, $iDBMinCollOutsidePercent, $iCollOutsidePercent ; check later if $iCollOutsidePercent obsolete

; constants
Global Const $THEllipseWidth = 200, $THEllipseHeigth = 150, $CollectorsEllipseWidth = 130, $CollectorsEllipseHeigth = 97.5
Global Const $centerX = 430, $centerY = 335 ; check later if $THEllipseWidth, $THEllipseHeigth obsolete
Global $hBitmapFirst
#endregion

; Switch Profile (IceCube) - Added by NguyenAnhHD
Global $profileString = ""
Global $ichkGoldSwitchMax, $itxtMaxGoldAmount, $icmbGoldMaxProfile, $ichkGoldSwitchMin, $itxtMinGoldAmount, $icmbGoldMinProfile
Global $ichkElixirSwitchMax, $itxtMaxElixirAmount, $icmbElixirMaxProfile, $ichkElixirSwitchMin, $itxtMinElixirAmount, $icmbElixirMinProfile
Global $ichkDESwitchMax, $itxtMaxDEAmount, $icmbDEMaxProfile, $ichkDESwitchMin, $itxtMinDEAmount, $icmbDEMinProfile
Global $ichkTrophySwitchMax, $itxtMaxTrophyAmount, $icmbTrophyMaxProfile, $ichkTrophySwitchMin, $itxtMinTrophyAmount, $icmbTrophyMinProfile

; CSV Deploy Speed (Roro-Titi) - Added by NguyenAnhHD
Global $g_hCmbCSVSpeed[2] = [$LB, $DB]
Global $g_iCmbCSVSpeed[2] = [$LB, $DB]
Global $g_hDivider

; SmartUpgrade (Roro-Titi) - Added by NguyenAnhHD
Global $ichkSmartUpgrade
Global $ichkIgnoreTH, $ichkIgnoreKing, $ichkIgnoreQueen, $ichkIgnoreWarden, $ichkIgnoreCC, $ichkIgnoreLab
Global $ichkIgnoreBarrack, $ichkIgnoreDBarrack, $ichkIgnoreFactory, $ichkIgnoreDFactory, $ichkIgnoreGColl, $ichkIgnoreEColl, $ichkIgnoreDColl
Global $iSmartMinGold, $iSmartMinElixir, $iSmartMinDark
Global $sBldgText, $sBldgLevel, $aString
Global $upgradeName[3] = ["", "", ""]
Global $UpgradeCost
Global $TypeFound = 0
Global $UpgradeDuration
Global $canContinueLoop = True

; Upgrade Management (MMHK) - Added by NguyenAnhHD
Global $g_ibUpdateNewUpgradesOnly = False
Global Const $UP = True, $DOWN = False, $TILL_END = True

; SwitchAcc (Demen) - Added By Demen
Global $profile = $g_sProfilePath & "\Profile.ini"
Global $ichkSwitchAcc = 0, $ichkTrain = 0, $icmbTotalCoCAcc, $nTotalCoCAcc = 8, $ichkSmartSwitch, $ichkCloseTraining
Global Enum $eNull, $eActive, $eDonate, $eIdle, $eStay, $eContinuous ; Enum for Profile Type & Switch Case & ForceSwitch
Global $ichkForceSwitch, $iForceSwitch, $eForceSwitch = 0, $iProfileBeforeForceSwitch
Global $ichkForceStayDonate
Global $nTotalProfile = 1, $nCurProfile = 1, $nNextProfile
Global $ProfileList
Global $aProfileType[8] ; Type of the all Profiles, 1 = active, 2 = donate, 3 = idle
Global $aMatchProfileAcc[8] ; Accounts match with All Profiles
Global $aDonateProfile, $aActiveProfile
Global $aAttackedCountSwitch[8], $ActiveSwitchCounter = 0, $DonateSwitchCounter = 0
Global $bReMatchAcc = False
Global $aTimerStart[8], $aTimerEnd[8]
Global $aRemainTrainTime[8], $aUpdateRemainTrainTime[8], $nMinRemainTrain
Global $aLocateAccConfig[8], $aAccPosY[8]

; SimpleTrain (Demen) - Added By Demen
Global $ichkSimpleTrain, $ichkPreciseTroops, $ichkFillArcher, $iFillArcher, $ichkFillEQ
Global $bWaitForCCTroopSpell = False	; ForceSwitch while waiting for CC troops - Demen
Global Enum $g_eFull, $g_eRemained, $g_eNoTrain
Global $g_abRCheckWrongTroops[2] = [False, False] ; Result of checking wrong troops & spells

; CoCStats - Added by NguyenAnhHD
Global $ichkCoCStats = 0
Global $MyApiKey = ""

; ClanHop (Rhinoceros & MantasM) - Added by NguyenAnhHD
Global $g_bChkClanHop = False

; Forecast - Added By Eloy
Global Const $COLOR_DEEPPINK = 0xFF1493
Global Const $COLOR_DARKGREEN = 0x006400
Global $oIE = ObjCreate("Shell.Explorer.2")
Global $grpForecast
Global $ieForecast
Global $dtStamps[0]
Global $lootMinutes[0]
Global $timeOffset = 0
Global $TimerForecast = 0
Global $lootIndexScaleMarkers
Global $currentForecast
Global $chkForecastBoost = 0, $txtForecastBoost = 0
Global $iChkForecastBoost = 0, $iTxtForecastBoost = 6
Global $cmbForecastHopingSwitchMax = 0, $cmbForecastHopingSwitchMin = 0
Global $chkForecastHopingSwitchMax = 0, $lblForecastHopingSwitchMax = 0, $txtForecastHopingSwitchMax = 2, $chkForecastHopingSwitchMin = 0, $lblForecastHopingSwitchMin = 0, $txtForecastHopingSwitchMin = 0
Global $ichkForecastHopingSwitchMax = 0, $icmbForecastHopingSwitchMax = 0 , $itxtForecastHopingSwitchMax = 2, $ichkForecastHopingSwitchMin = 0, $icmbForecastHopingSwitchMin = 0, $itxtForecastHopingSwitchMin = 2
Global $icmbSwLang = 0
Global $cmbSwLang = 0