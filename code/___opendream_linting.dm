#ifdef OPENDREAM
//1000-1999
#pragma FileAlreadyIncluded error
#pragma MissingIncludedFile error
#pragma MisplacedDirective error
#pragma UndefineMissingDirective error
#pragma DefinedMissingParen error
#pragma ErrorDirective error
#pragma WarningDirective warning
#pragma MiscapitalizedDirective error

//2000-2999
#pragma SoftReservedKeyword error
#pragma DuplicateVariable error
#pragma DuplicateProcDefinition error
#pragma PointlessParentCall error
#pragma PointlessBuiltinCall error
#pragma SuspiciousMatrixCall error
#pragma FallbackBuiltinArgument error
#pragma MalformedRange error
#pragma InvalidRange error
#pragma InvalidSetStatement error
#pragma InvalidOverride error
#pragma DanglingVarType error
#pragma MissingInterpolatedExpression error
#pragma AmbiguousResourcePath error
#pragma UnsupportedTypeCheck notice
#pragma InvalidReturnType notice
#pragma InvalidVarType error
#pragma ImplicitNullType notice
#pragma LostTypeInfo notice

//3000-3999
#pragma EmptyBlock error
#pragma EmptyProc disabled
#pragma UnsafeClientAccess disabled
#pragma SuspiciousSwitchCase error
#pragma AssignmentInConditional error
#pragma AmbiguousInOrder error

// Typemaker aliases, for future use
// This is for use in proc signatures like "as BOOL" or "as VOID".
#define OD_BOOL num
#define OD_VOID null
#define OD_DIR num
// This one is a stopgap until SpacemanDMM doesn't trip up on paths.
#define OD_LIST(X) /list(X)
// as above, but assoc
#define OD_MAP(X, Y) /list(X, Y)
#define OD_PATH(X) path(X)
// this one needs to be removed when paths-as-instances are made the default, it's identical to OD_PATH presently
#define OD_INST(X) X
#define OD_PARAM(X) params[##X]
#else
#define OD_BOOL num
#define OD_VOID null
#define OD_DIR num
#define OD_LIST(X) anything
#define OD_MAP(X, Y) anything
#define OD_PATH(X) anything
#define OD_INST(X) anything
#define OD_PARAM(X) anything
#endif