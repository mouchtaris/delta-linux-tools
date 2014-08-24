# vim: ts=4
ifeq ($(WX_WIDGETS),)
$(error 'WX_WIDGETS not set')
endif

Sources =	./Delta/FileReadersLib/Src/StringFile.cpp \
			./Delta/FileReadersLib/Src/BufferFile.cpp \
			./Delta/DebugLib/Src/DAllocationStats.cpp \
			./Delta/DebugLib/Src/DMemoryManager.cpp \
			./Delta/DebugLib/Src/DDebug.cpp \
			./Delta/DebugLib/Src/DMemoryCapsule.cpp \
			./Delta/DebugLib/Src/DSmallObjectAllocator.cpp \
			./Delta/Common/Src/DeltaByteCodeTypes.cpp \
			./Delta/Common/Src/DeltaVars.cpp \
			./Delta/Common/Src/DeltaFunc.cpp \
			./Delta/Common/Src/DeltaUnparsedCall.cpp \
			./Delta/Common/Src/DeltaConstantProgramValues.cpp \
			./Delta/Common/Src/DeltaLocal.cpp \
			./Delta/Common/Src/DeltaBlock.cpp \
			./Delta/Common/Src/DeltaUnparsedCallsInStmt.cpp \
			./Delta/Common/Src/DeltaUnparsedCallsInStmtHolder.cpp \
			./Delta/UtilLib/Src/uvalidator.cpp \
			./Delta/UtilLib/Src/usafeiterators.cpp \
			./Delta/UtilLib/Src/ulexutil.cpp \
			./Delta/UtilLib/Src/ubinaryio.cpp \
			./Delta/UtilLib/Src/uthreadlib.cpp \
			./Delta/UtilLib/Src/uvalidatable.cpp \
			./Delta/UtilLib/Src/ufiles.cpp \
			./Delta/UtilLib/Src/utreenode.cpp \
			./Delta/UtilLib/Src/ustrings.cpp \
			./Delta/UtilLib/Src/ugeometry.cpp \
			./Delta/UtilLib/Src/uerrorno.cpp \
			./Delta/UtilLib/Src/ulatedestructor.cpp \
			./Delta/UtilLib/Src/udynamiclibloader.cpp \
			./Delta/UtilLib/Src/ueditormixin.cpp \
			./Delta/UtilLib/Src/uhash.cpp \
			./Delta/UtilLib/Src/uinstanceidgenerator.cpp \
			./Delta/UtilLib/Src/uerrorclass.cpp \
			./Delta/UtilLib/Src/uinit.cpp \
			./Delta/UtilLib/Src/usystem.cpp \
			./Delta/DeltaCompiler/Src/LibraryTypes.cpp \
			./Delta/DeltaCompiler/Src/ParseAssignments.cpp \
			./Delta/DeltaCompiler/Src/CompilerAPI.cpp \
			./Delta/DeltaCompiler/Src/DeltaSyntax.cpp \
			./Delta/DeltaCompiler/Src/ExprCleaner.cpp \
			./Delta/DeltaCompiler/Src/LibraryNamespace.cpp \
			./Delta/DeltaCompiler/Src/ParseTableConstruction.cpp \
			./Delta/DeltaCompiler/Src/ASTAttributeStringifier.cpp \
			./Delta/DeltaCompiler/Src/ParseFunctionsAndCalls.cpp \
			./Delta/DeltaCompiler/Src/LibraryDefsParser.cpp \
			./Delta/DeltaCompiler/Src/BuildDependencies.cpp \
			./Delta/DeltaCompiler/Src/DeltaLexAnalyser.cpp \
			./Delta/DeltaCompiler/Src/ParseTernary.cpp \
			./Delta/DeltaCompiler/Src/DeltaDependenciesParser.cpp \
			./Delta/DeltaCompiler/Src/ParseArithmetic.cpp \
			./Delta/DeltaCompiler/Src/LibraryDefsScanner.cpp \
			./Delta/DeltaCompiler/Src/ExceptionHandlingActions.cpp \
			./Delta/DeltaCompiler/Src/ParseLogical.cpp \
			./Delta/DeltaCompiler/Src/ASTNode.cpp \
			./Delta/DeltaCompiler/Src/DeltaParser.cpp \
			./Delta/DeltaCompiler/Src/ParseActions.cpp \
			./Delta/DeltaCompiler/Src/LibraryNamespaceHolder.cpp \
			./Delta/DeltaCompiler/Src/Unparsable.cpp \
			./Delta/DeltaCompiler/Src/TargetCode.cpp \
			./Delta/DeltaCompiler/Src/TypeCheck.cpp \
			./Delta/DeltaCompiler/Src/LocalDataHandling.cpp \
			./Delta/DeltaCompiler/Src/ParseTerms.cpp \
			./Delta/DeltaCompiler/Src/ParseAttributes.cpp \
			./Delta/DeltaCompiler/Src/AutoCollection.cpp \
			./Delta/DeltaCompiler/Src/SelectiveStepInPreparator.cpp \
			./Delta/DeltaCompiler/Src/ParseParms.cpp \
			./Delta/DeltaCompiler/Src/ASTCreationActions.cpp \
			./Delta/DeltaCompiler/Src/DeltaCompErrorMsg.cpp \
			./Delta/DeltaCompiler/Src/LibraryFuncSignatures.cpp \
			./Delta/DeltaCompiler/Src/ParseStmts.cpp \
			./Delta/DeltaCompiler/Src/Expr.cpp \
			./Delta/DeltaCompiler/Src/FunctionReturnTypesManager.cpp \
			./Delta/DeltaCompiler/Src/DescriptiveParseErrorHandler.cpp \
			./Delta/DeltaCompiler/Src/Optimizer.cpp \
			./Delta/DeltaCompiler/Src/FunctionValueReturnChecker.cpp \
			./Delta/DeltaCompiler/Src/UnusedTempAssignElimination.cpp \
			./Delta/DeltaCompiler/Src/InterCode.cpp \
			./Delta/DeltaCompiler/Src/DeltaCompilerInit.cpp \
			./Delta/DeltaCompiler/Src/ParseControlFlowStmts.cpp \
			./Delta/DeltaCompiler/Src/DeltaScanner.cpp \
			./Delta/DeltaCompiler/Src/DebugNamingForStaticVars.cpp \
			./Delta/DeltaCompiler/Src/ASTTranslationVisitor.cpp \
			./Delta/DeltaCompiler/Src/Symbol.cpp \
			./Delta/DeltaCompiler/Src/Unparse.cpp \
			./Delta/DeltaCompiler/Src/DeltaDependenciesScanner.cpp \
			./Delta/DeltaCompiler/Src/ParseConstants.cpp \
			./Delta/DeltaCompiler/Src/ParseLvalues.cpp \
			./Delta/DeltaCompiler/Src/ASTUnparseVisitor.cpp \
			./Delta/DeltaDebuggedVMFacade/Src/DeltaDebuggedVMFacade.cpp \
			./Delta/ResourceLoaderLib/Src/RcAttrRDParser.cpp \
			./Delta/ResourceLoaderLib/Src/RcLoaderAPI.cpp \
			./Delta/ResourceLoaderLib/Src/RcParser.cpp \
			./Delta/ResourceLoaderLib/Src/RcParseActions.cpp \
			./Delta/ResourceLoaderLib/Src/RcLexAnalyser.cpp \
			./Delta/ResourceLoaderLib/Src/RcLoaderErrorMsg.cpp \
			./Delta/ResourceLoaderLib/Src/RcAttrLexAn.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaLibFuncOverloading.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaLibraryObjectCreator.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaValueValidator.cpp \
			./Delta/DeltaVirtualMachine/Src/PushArg.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaAssert.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaTable.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaAssertExtensions.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaValue.cpp \
			./Delta/DeltaVirtualMachine/Src/ContainerDelayedCollector.cpp \
			./Delta/DeltaVirtualMachine/Src/Block.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaExternIdFieldGetter.cpp \
			./Delta/DeltaVirtualMachine/Src/Jump.cpp \
			./Delta/DeltaVirtualMachine/Src/Table.cpp \
			./Delta/DeltaVirtualMachine/Src/LoadByteCode.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaArgumentsRecycler.cpp \
			./Delta/DeltaVirtualMachine/Src/Arithmetic.cpp \
			./Delta/DeltaVirtualMachine/Src/Execute.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaVMRegistry.cpp \
			./Delta/DeltaVirtualMachine/Src/Func.cpp \
			./Delta/DeltaVirtualMachine/Src/BlockIdStacks.cpp \
			./Delta/DeltaVirtualMachine/Src/CallTracesAndCallInformation.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaLibFuncBinder.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaLibraryFuncArgsBinder.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaString.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaDebugExtensions.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaTableFactory.cpp \
			./Delta/DeltaVirtualMachine/Src/FuncRet.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaProfiler.cpp \
			./Delta/DeltaVirtualMachine/Src/ForEach.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaClosureCreator.cpp \
			./Delta/DeltaVirtualMachine/Src/TryTrapThrow.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaClosure.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaRuntimeError.cpp \
			./Delta/DeltaVirtualMachine/Src/Assign.cpp \
			./Delta/DeltaVirtualMachine/Src/OperatorOverloading.cpp \
			./Delta/DeltaVirtualMachine/Src/FuncEnter.cpp \
			./Delta/DeltaVirtualMachine/Src/TranslateOperand.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaClosureVarProxy.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaObjectValidator.cpp \
			./Delta/DeltaVirtualMachine/Src/VMInit.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaObject.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaExceptionHandling.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaDebugDynamicActivator.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaVirtualMachine.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaClosureHandling.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaExternId.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaExternIdFactory.cpp \
			./Delta/DeltaVirtualMachine/Src/DeltaCollectableContainer.cpp \
			./Delta/DeltaConsoleDebugger/Src/DebugWatchValueRcDecoder.cpp \
			./Delta/DeltaConsoleDebugger/Src/DeltaConsoleDebugger.cpp \
			./Delta/DebugClient/Src/DebugClient.cpp \
			./Delta/DebugClient/Src/DeltaDebugClientBreakPoints.cpp \
			./Delta/DeltaDebugMessageEncoding/Src/DeltaDebugMessageEncoding.cpp \
			./Delta/DebugExprEvaluator/Src/DebugWatchValueRcEncoder.cpp \
			./Delta/DebugExprEvaluator/Src/DebugWatchValueXmlEncoder.cpp \
			./Delta/DebugExprEvaluator/Src/DebugWatchValueTextEncoders.cpp \
			./Delta/DebugExprEvaluator/Src/DebugExprParserAPI.cpp \
			./Delta/DebugExprEvaluator/Src/DebugExprParser.cpp \
			./Delta/DebugExprEvaluator/Src/DebugReservedTableAttributes.cpp \
			./Delta/DebugExprEvaluator/Src/DebugEvaluatedExpr.cpp \
			./Delta/DebugExprEvaluator/Src/DebugAttributeInformation.cpp \
			./Delta/DebugExprEvaluator/Src/DeltaValueToDebugWatchValueInfo.cpp \
			./Delta/DebugExprEvaluator/Src/DebugClosureInformation.cpp \
			./Delta/DebugExprEvaluator/Src/DebugMonitors.cpp \
			./Delta/DebugExprEvaluator/Src/DebugExprLexAn.cpp \
			./Delta/DebugExprEvaluator/Src/DebugExprParseActions.cpp \
			./Delta/DebugExprEvaluator/Src/DebugExprLibraryFunctions.cpp \
			./Delta/DeltaStdLib/Src/VectorIterLib.cpp \
			./Delta/DeltaStdLib/Src/ListIterLib.cpp \
			./Delta/DeltaStdLib/Src/BufferLib.cpp \
			./Delta/DeltaStdLib/Src/ShMemLib.cpp \
			./Delta/DeltaStdLib/Src/TableLib.cpp \
			./Delta/DeltaStdLib/Src/ListLib.cpp \
			./Delta/DeltaStdLib/Src/FileIOLib.cpp \
			./Delta/DeltaStdLib/Src/ReaderWriterLib.cpp \
			./Delta/DeltaStdLib/Src/BitOpLib.cpp \
			./Delta/DeltaStdLib/Src/StringLib.cpp \
			./Delta/DeltaStdLib/Src/ObjectLib.cpp \
			./Delta/DeltaStdLib/Src/MiscLib.cpp \
			./Delta/DeltaStdLib/Src/SocketsLib.cpp \
			./Delta/DeltaStdLib/Src/VMRegLib.cpp \
			./Delta/DeltaStdLib/Src/MathLib.cpp \
			./Delta/DeltaStdLib/Src/DeltaStdLib.cpp \
			./Delta/DeltaStdLib/Src/ArgCheck.cpp \
			./Delta/DeltaStdLib/Src/AlgorithmLib.cpp \
			./Delta/DeltaStdLib/Src/VectorLib.cpp \
			./Delta/DeltaStdLib/Src/DeltaTableSerialiser.cpp \
			./Delta/DeltaStdLib/Src/TableIterLib.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugMessengerProxy.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugUserVarsInspector.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugExecutionBreakController.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugContextHandler.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugLinesWithCodeHolder.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugCallStackInspector.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugRecentFunctionResults.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugExtensions.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugExecutionCallbacks.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugServerBreakPoints.cpp \
			./Delta/DeltaVirtualMachineDebugExtensions/Src/DeltaDebugTraceCommandHandler.cpp \
			./Delta/DeltaPureVMFacade/Src/DeltaPureVMFacade.cpp \
			./Delta/DebugBreakPointHolder/Src/DebugBreakPointHolder.cpp \
			./Delta/SocketLib/Src/SocketPacketNetLink.cpp \
			./Delta/SocketLib/Src/SocketNetLink.cpp \
			./Delta/SocketLib/Src/NetLink.cpp \
			./Delta/SocketLib/Src/SocketLib.cpp \
			./Delta/DebugServer/Src/DispatchRequest.cpp \
			./Delta/DebugServer/Src/DebugServer.cpp \
			./Delta/DeltaSyntaxTree/Source/TreeNode.cpp \
			./Delta/DeltaSyntaxTree/Source/TreeToStringVisitor.cpp \
			./Delta/DeltaSyntaxTree/Source/TreeVisitor.cpp \

SourcesWx =	\
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCheckListBox.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxChoicebookEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxChildFocusEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxNotebookEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCursor.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSearchCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSysColourChangedEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxRadioBox.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMoveEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxBitmap.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDC.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxKeyEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTreebook.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxImageList.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxGenericDirCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTextCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxNumberEntryDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxListCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPrintDialogData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSplashScreen.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/wxWrapperUtilFunctions.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxBoxSizer.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPrintData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPasswordEntryDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxInitDialogEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxStdDialogButtonSizer.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxColourDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxIconLocation.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxObjectRefData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxClientDC.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMemoryDC.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDirFilterListCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxNotifyEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSlider.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxGenericValidator.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTimeSpan.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTimerEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFontPickerEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPrintDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSplitterWindow.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFont.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxRect.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFontPickerCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWizardEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxColour.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxEvtHandler.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDirDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDropFilesEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCalendarCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFileDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxBitmapButton.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWizardPageSimple.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxToolbook.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMenuItem.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWindowCreateEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxNavigationKeyEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMultiChoiceDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFlexGridSizer.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxClipboardTextEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDirPickerCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxUpdateUIEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTextEntryDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMask.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxStaticLine.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxShowEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPaletteChangedEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCollapsiblePane.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxToolBar.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTopLevelWindow.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxNotebook.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWindowDestroyEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxListbookEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxScrolledWindow.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSpinButton.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxComboBox.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFindReplaceDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCaret.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxBufferedDC.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDateTime.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSize.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxLogChain.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxObject.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxJoystickEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSizerItem.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSpinCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMessageDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxValidator.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTreeCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFontDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxStaticBox.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxChoicebook.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFindDialogEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPen.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPaintDC.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWizard.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTreebookEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxLog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCollapsiblePaneEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCommandEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTreeEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPanel.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDateEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPalette.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMouseCaptureLostEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxListbook.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxListBox.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWidgetsLib.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSizerFlags.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxStatusBar.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWindowDC.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFileDirPickerEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCalendarDateAttr.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxHelpEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxIdleEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxApp.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxClassInfo.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxGridSizer.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDatePickerCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMenuEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxIconizeEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSizeEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFilePickerCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMenuBar.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxColourPickerEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPoint.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPickerBase.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDisplayChangedEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCloseEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxToggleButton.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxToolTip.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxListItem.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxImage.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxAcceleratorTable.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMenu.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWizardPage.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxQueryNewPaletteEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTreeItemData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMouseEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSplitterEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxToolBarToolBase.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxToolbookEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCheckBox.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMouseCaptureChangedEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxCalendarEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxActivateEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxEraseEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTimer.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxMaximizeEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDropTarget.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDateSpan.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTreeItemId.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxGauge.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxScrollBar.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxJoystick.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxGlobalFunctions.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxColourData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxStaticText.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPageSetupDialogData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxWindow.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxChoice.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxScrollWinEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxStaticBoxSizer.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSingleChoiceDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxAcceleratorEntry.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxIconBundle.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFindReplaceData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxProgressDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSizer.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxRadioButton.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxLogWindow.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxIndividualLayoutConstraint.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTextAttr.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPageSetupDialog.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxVisualAttributes.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxIcon.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFontData.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSetCursorEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxSpinEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxListView.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxColourPickerCtrl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxControlWithItems.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxBrush.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxAboutDialogInfo.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxContextMenuEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxButton.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxListItemAttr.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFocusEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxLayoutConstraints.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxScrollEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxRegion.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxControl.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxTextValidator.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxFrame.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxPaintEvent.cpp \
			./Delta/DeltaExtraLibraries/wxWidgets/Src/DeltaWxBufferedPaintDC.cpp \

SourcesXML =	\
				./Delta/DeltaExtraLibraries/XMLParser/Src/XmlLoaderErrorMsg.cpp \
				./Delta/DeltaExtraLibraries/XMLParser/Src/XmlLex.cpp \
				./Delta/DeltaExtraLibraries/XMLParser/Src/DeltaXMLParserLib.cpp \
				./Delta/DeltaExtraLibraries/XMLParser/Src/XmlParser.cpp \
				./Delta/DeltaExtraLibraries/XMLParser/Src/XmlLoaderAPI.cpp \
				./Delta/DeltaExtraLibraries/XMLParser/Src/ReferenceTranslation.cpp \
				./Delta/DeltaExtraLibraries/XMLParser/Src/XmlParseActions.cpp \

SourcesDeltaCompiler =	\
						./DeltaAnsiCompiler/Source/main.cpp \
						./DeltaAnsiCompiler/Source/DeltaCompilerInvoker.cpp \

SourcesDeltaVM =	\
					./DeltaAnsiVMDebug/Source/CommandLineArguments.cpp \
					./DeltaAnsiVMDebug/Source/main.cpp \
					./DeltaAnsiVMDebug/Source/CommandLineArgumentsFactory.cpp \

Objects = $(foreach Source, $(Sources), _build/$(Source).o)
ObjectsWx = $(foreach Source, $(SourcesWx), _build/$(Source).o)
ObjectsXML = $(foreach Source, $(SourcesXML), _build/$(Source).o)
ObjectsDeltaCompiler = $(foreach Source, $(SourcesDeltaCompiler), _build/$(Source).o)
ObjectsDeltaVM = $(foreach Source, $(SourcesDeltaVM), _build/$(Source).o)

ObjectsD = $(foreach Source, $(Sources), _build/$(Source)_d.o)
ObjectsWxD = $(foreach Source, $(SourcesWx), _build/$(Source)_d.o)
ObjectsXMLD = $(foreach Source, $(SourcesXML), _build/$(Source)_d.o)
ObjectsDeltaCompilerD = $(foreach Source, $(SourcesDeltaCompiler), _build/$(Source)_d.o)
ObjectsDeltaVMD = $(foreach Source, $(SourcesDeltaVM), _build/$(Source)_d.o)

Depends =	\
			$(Objects:.o=.d) $(ObjectsWx:.o=.d) $(ObjectsXML:.o=.d) $(ObjectsDeltaCompiler:.o=.d) $(ObjectsDeltaVM:.o=.d)	\
			$(ObjectsD:.o=.d) $(ObjectsWxD:.o=.d) $(ObjectsXMLD:.o=.d) $(ObjectsDeltaCompilerD:.o=.d) $(ObjectsDeltaVMD:.o=.d)

LDFLAGS_COMMON = -m32 -Xlinker --rpath -Xlinker $(PWD)/lib -rdynamic -L$(PWD)/lib
CXXFLAGS_COMMON = -ansi -pedantic -pthread -m32
CPPFLAGS_COMMON =	\
					-I./Delta/FileReadersLib/Include \
					-I./Delta/DebugLib/Include \
					-I./Delta/DeltaDebugLoader/Include \
					-I./Delta/DebugWatchValueInfo/Include \
					-I./Delta/Common/Include \
					-I./Delta/UtilLib/Include \
					-I./Delta/DeltaCompiler/Include \
					-I./Delta/DeltaDebuggedVMFacade/Include \
					-I./Delta/ResourceLoaderLib/Include \
					-I./Delta/DeltaVirtualMachine/Include \
					-I./Delta/DeltaConsoleDebugger/Include \
					-I./Delta/DebugClient/Include \
					-I./Delta/DeltaDebugMessageEncoding/Include \
					-I./Delta/DebugExprEvaluator/Include \
					-I./Delta/DeltaStdLib/Include \
					-I./Delta/DeltaVirtualMachineDebugExtensions/Include \
					-I./Delta/DeltaPureVMFacade/Include \
					-I./Delta/DebugBreakPointHolder/Include \
					-I./Delta/SocketLib/Include \
					-I./Delta/DebugServer/Include \
					-I./Delta/DeltaSyntaxTree/Include \
					-I./Delta/DeltaExtraLibraries/XMLParser/Include \
					-I./DeltaAnsiCompiler/Include \
					-I./DeltaAnsiVMDebug/Include \
					-I./Delta/DeltaExtraLibraries/wxWidgets/Include \
					-D_UNIX_ \

LDFLAGS_RELEASE		= $(LDFLAGS_COMMON)
CXXFLAGS_RELEASE	= $(CXXFLAGS_COMMON) -O2
CPPFLAGS_RELEASE	= $(CPPFLAGS_COMMON) $(shell $(WX_WIDGETS)/bin/wx-config --debug=no --unicode=yes --cppflags)

LDFLAGS_DEBUG		= $(LDFLAGS_COMMON)
CXXFLAGS_DEBUG		= $(CXXFLAGS_COMMON) -g -O0
CPPFLAGS_DEBUG		= $(CPPFLAGS_COMMON) -D_DEBUG $(shell $(WX_WIDGETS)/bin/wx-config --debug=yes --unicode=yes --cppflags)

_build/%.cpp.o : %.cpp
	if ! [ -d $(dir $@) ] ; then mkdir --verbose --parent $(dir $@) ; fi
	$(CXX) $(CXXFLAGS_RELEASE) $(CPPFLAGS_RELEASE) -c -MD -MF _build/$*.cpp.d -o $@ $<
_build/%.cpp_d.o : %.cpp
	if ! [ -d $(dir $@) ] ; then mkdir --verbose --parent $(dir $@) ; fi
	$(CXX) $(CXXFLAGS_DEBUG) $(CPPFLAGS_DEBUG) -c -MD -MF _build/$*.cpp_d.d -o $@ $<

all: lib/libdelta.so lib/libxml.so bin/nmdc bin/nmdvm bin/nmdisco lib/libdeltad.so lib/libxmld.so bin/nmdcd bin/nmdvmd bin/nmdiscod lib/libwx.so lib/libwxd.so
clean:
	for d in _build bin lib ; do if [ -d "$$d" ] ; then rm -rv "$$d" ; fi ; done ;
.PHONY: all clean

lib/libdelta.so: $(Objects)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(Objects) $(LDFLAGS_RELEASE)
lib/libxml.so: $(ObjectsXML)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(ObjectsXML) $(LDFLAGS_RELEASE)
lib/libwx.so: $(ObjectsWx)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(ObjectsWx) $(LDFLAGS_RELEASE) -Xlinker --rpath -Xlinker $(shell $(WX_WIDGETS)/bin/wx-config --debug=no --unicode --prefix)/lib $(shell $(WX_WIDGETS)/bin/wx-config --debug=no --unicode --libs)

bin/nmdc: $(ObjectsDeltaCompiler) lib/libdelta.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) $(ObjectsDeltaCompiler) -ldelta -ldl
bin/nmdvm: $(ObjectsDeltaVM) lib/libdelta.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) $(ObjectsDeltaVM) -ldelta -ldl
bin/nmdisco: lib/libdelta.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) -ldelta -ldl



lib/libdeltad.so: $(ObjectsD)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsD) $(LDFLAGS_DEBUG)
lib/libxmld.so: $(ObjectsXMLD)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsXMLD) $(LDFLAGS_DEBUG)
lib/libwxd.so: $(ObjectsWxD)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsWxD) $(LDFLAGS_DEBUG) -Xlinker --rpath -Xlinker $(shell $(WX_WIDGETS)/bin/wx-config --debug --unicode --prefix)/lib $(shell $(WX_WIDGETS)/bin/wx-config --debug --unicode --libs)

bin/nmdcd: $(ObjectsDeltaCompilerD) lib/libdeltad.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) $(ObjectsDeltaCompilerD) -ldeltad -ldl
bin/nmdvmd: $(ObjectsDeltaVMD) lib/libdeltad.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) $(ObjectsDeltaVMD) -ldeltad -ldl
bin/nmdiscod: lib/libdeltad.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFlAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) -ldeltad -ldl



-include $(Depends)
