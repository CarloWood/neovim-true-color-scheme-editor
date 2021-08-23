" Vim color file for C++ source code.
" Created by Carlo Wood July 2018.

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "cwcolors"

" Using not-entirely white on not-entirely black.
set background=dark
hi Normal               guifg=#e6e6e6 guibg=#1F1F1F guisp=#1F1F1F gui=NONE

" Matching parenthesis -- because my cursor inverts fore- and background, the
" foreground color needs to be the same as the foreground color of Normal,
" because that is the (background) color of the cursor block.
" The background color specified here is the background color of the matching
" parenthesis.
hi MatchParen           guifg=#e6e6e6 guibg=#316264 guisp=#FFA500 gui=NONE

"
" For the following layout see the help text in vim for E669 (:help E669).
" Each group name at the top of a section is the preferred group; the ones
" below that are minor groups that default to the prefered group if not
" specified.
"
" ============================================================================
" * COMMENT                                                                  *

" C comment delimiters.
hi cCommentStart        guifg=#bc95d8
" C comment text.
hi cComment             guifg=#6f5674
" C++ comments.
hi cCommentL            guifg=#767676 guibg=#1a1a1a
" Code that is commented out with #if 0 ... #endif.
hi cCppOutIf2           guifg=#a1a591
" Doxygen comments.
hi cDoxygenCommentLead  guifg=#ff78b9
hi cDoxygenComment      guifg=#dfbccb

" ============================================================================
" * CONSTANT                                                                 *

" __GNUC__ __FUNCTION__ __PRETTY_FUNCTION__ __func__
" __LINE__ __FILE__ __DATE__ __TIME__ __STDC__
" __STDC_VERSION__
" CHAR_BIT MB_LEN_MAX MB_CUR_MAX
" UCHAR_MAX UINT_MAX ULONG_MAX USHRT_MAX
" CHAR_MIN INT_MIN LONG_MIN SHRT_MIN
" CHAR_MAX INT_MAX LONG_MAX SHRT_MAX
" SCHAR_MIN SINT_MIN SLONG_MIN SSHRT_MIN
" SCHAR_MAX SINT_MAX SLONG_MAX SSHRT_MAX
" __func__ __VA_ARGS__
" LLONG_MIN LLONG_MAX ULLONG_MAX
" INT8_MIN INT16_MIN INT32_MIN INT64_MIN
" INT8_MAX INT16_MAX INT32_MAX INT64_MAX
" UINT8_MAX UINT16_MAX UINT32_MAX UINT64_MAX
" INT_LEAST8_MIN INT_LEAST16_MIN INT_LEAST32_MIN INT_LEAST64_MIN
" INT_LEAST8_MAX INT_LEAST16_MAX INT_LEAST32_MAX INT_LEAST64_MAX
" UINT_LEAST8_MAX UINT_LEAST16_MAX UINT_LEAST32_MAX UINT_LEAST64_MAX
" INT_FAST8_MIN INT_FAST16_MIN INT_FAST32_MIN INT_FAST64_MIN
" INT_FAST8_MAX INT_FAST16_MAX INT_FAST32_MAX INT_FAST64_MAX
" UINT_FAST8_MAX UINT_FAST16_MAX UINT_FAST32_MAX UINT_FAST64_MAX
" INTPTR_MIN INTPTR_MAX UINTPTR_MAX
" INTMAX_MIN INTMAX_MAX UINTMAX_MAX
" PTRDIFF_MIN PTRDIFF_MAX SIG_ATOMIC_MIN SIG_ATOMIC_MAX
" SIZE_MAX WCHAR_MIN WCHAR_MAX WINT_MIN WINT_MAX
" FLT_RADIX FLT_ROUNDS FLT_DIG FLT_MANT_DIG FLT_EPSILON DBL_DIG DBL_MANT_DIG DBL_EPSILON
" LDBL_DIG LDBL_MANT_DIG LDBL_EPSILON FLT_MIN FLT_MAX FLT_MIN_EXP FLT_MAX_EXP FLT_MIN_10_EXP FLT_MAX_10_EXP
" DBL_MIN DBL_MAX DBL_MIN_EXP DBL_MAX_EXP DBL_MIN_10_EXP DBL_MAX_10_EXP LDBL_MIN LDBL_MAX LDBL_MIN_EXP LDBL_MAX_EXP
" LDBL_MIN_10_EXP LDBL_MAX_10_EXP HUGE_VAL CLOCKS_PER_SEC NULL LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY
" LC_NUMERIC LC_TIME SIG_DFL SIG_ERR SIG_IGN SIGABRT SIGFPE SIGILL SIGHUP SIGINT SIGSEGV SIGTERM
" SIGABRT SIGALRM SIGCHLD SIGCONT SIGFPE SIGHUP SIGILL SIGINT SIGKILL SIGPIPE SIGQUIT SIGSEGV
" SIGSTOP SIGTERM SIGTRAP SIGTSTP SIGTTIN SIGTTOU SIGUSR1 SIGUSR2
" _IOFBF _IOLBF _IONBF BUFSIZ EOF WEOF FOPEN_MAX FILENAME_MAX L_tmpnam
" SEEK_CUR SEEK_END SEEK_SET TMP_MAX stderr stdin stdout EXIT_FAILURE EXIT_SUCCESS RAND_MAX
" SIGBUS SIGPOLL SIGPROF SIGSYS SIGURG SIGVTALRM SIGXCPU SIGXFSZ
" SIGWINCH SIGINFO
" E2BIG EACCES EADDRINUSE EADDRNOTAVAIL EAFNOSUPPORT EAGAIN EALREADY EBADF
" EBADMSG EBUSY ECANCELED ECHILD ECONNABORTED ECONNREFUSED ECONNRESET EDEADLK
" EDESTADDRREQ EDOM EDQUOT EEXIST EFAULT EFBIG EHOSTUNREACH EIDRM EILSEQ
" EINPROGRESS EINTR EINVAL EIO EISCONN EISDIR ELOOP EMFILE EMLINK EMSGSIZE
" EMULTIHOP ENAMETOOLONG ENETDOWN ENETRESET ENETUNREACH ENFILE ENOBUFS ENODATA
" ENODEV ENOENT ENOEXEC ENOLCK ENOLINK ENOMEM ENOMSG ENOPROTOOPT ENOSPC ENOSR
" ENOSTR ENOSYS ENOTCONN ENOTDIR ENOTEMPTY ENOTRECOVERABLE ENOTSOCK ENOTSUP
" ENOTTY ENXIO EOPNOTSUPP EOVERFLOW EOWNERDEAD EPERM EPIPE EPROTO
" EPROTONOSUPPORT EPROTOTYPE ERANGE EROFS ESPIPE ESRCH ESTALE ETIME ETIMEDOUT
" ETXTBSY EWOULDBLOCK EXDEV
" M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI_2 M_PI_4
" M_1_PI M_2_PI M_2_SQRTPI M_SQRT2 M_SQRT1_2
" true false
hi cConstant            guifg=#607ffc
" __cplusplus nullptr
" ATOMIC_FLAG_INIT ATOMIC_VAR_INIT ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
" ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
" ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
hi def link cppConstant         cConstant

" Double quoted strings including the quotes.
hi cString              guifg=#ece409
hi cCppString           guifg=#ece409

" A character literal.
hi cCharacter           guifg=#fcff00

" An integer literal.
hi cNumber	        guifg=#8ea3ff
hi def link cOctal              cNumber
" Binary, decimal or hexadecimal, optionally followed by u and/or one or two l's.
hi def link cppNumber           cNumber

" true, false
hi cppBoolean	        guifg=#0e56ff

" A floating point literal (float, double and long double).
hi def link cFloat              cNumber

" ============================================================================
" * IDENTIFIER                                                               *

" Identifier    Any variable name.
"
" Only used by tags.vim scripts. See below.
hi Identifier           guifg=#b5ff6f

" Function      Function name (also: methods for classes).
"
" Only used by tags.vim scripts. See below.
hi cFunction	        guifg=#90CBF1

" ============================================================================
" * STATEMENT

" goto break return continue asm __asm__ 
hi cStatement	        guifg=#00ffea
" new delete this friend using
hi link cppStatement        cStatement
" public protected private
hi cppAccess            guifg=#b07626           " Same as cppStatement by default.
" const_cast static_cast dynamic_cast reinterpret_cast
"hi cppCast             guifg=#00ffea           " Same as cppStatement by default.

" if else switch
hi cConditional	        guifg=#0462ff

" while for do
hi cRepeat	        guifg=#ffa304

" case default
hi cLabel	        guifg=#FFEE68
" A label, excluding the colon.
hi cUserLabel           guifg=#ff1f1f

" sizeof typeof __real__ __imag__ _Alignof alignof _Generic _Static_assert static_assert
hi cOperator	        guifg=#FC6984
" operator typeid and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
hi def link cppOperator         cOperator

" Keyword       Any other keyword.
"
" Not used for C++.
hi Keyword	        guifg=#FFEE68

" throw try catch noexcept
hi cppExceptions        guifg=#FC4234

" ============================================================================
" * PREPROC                                                                  *

" PreProc       Generic preprocessor.
"
" #pragma
hi cPreProc	        guifg=#bb70e0

" Include       Preprocessor #include.
"
" Preprocessor #include, unfortunately including the space following it, so
" use the same background color as Normal.
hi cInclude             guifg=#ffa50a
hi cIncluded            guifg=#d4bb7f

" Macro         Preprocessor #define.
"
" See https://neovim.io/doc/user/syntax.html
" #define
hi cDefine	        guifg=#BF81FA

" PreCondit     Preprocessor #if, #else, #endif, etc.
"
" #if, #ifdef, #else, #elif, #endif
hi cPreCondit	        guifg=#BF81FA

" ============================================================================
" * TYPE                                                                     *

" int long short char void signed unsigned float double
" size_t ssize_t off_t wchar_t ptrdiff_t sig_atomic_t fpos_t
" clock_t time_t va_list jmp_buf FILE DIR div_t ldiv_t
" mbstate_t wctrans_t wint_t wctype_t
" _Bool bool _Complex complex _Imaginary imaginary
" int8_t int16_t int32_t int64_t
" uint8_t uint16_t uint32_t uint64_t
" int_least8_t int_least16_t int_least32_t int_least64_t
" uint_least8_t uint_least16_t uint_least32_t uint_least64_t
" int_fast8_t int_fast16_t int_fast32_t int_fast64_t
" uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
" intptr_t uintptr_t intmax_t uintmax_t
" __label__ __complex__ __volatile__
" char16_t char32_t
hi cType                guifg=#19b30b
" bool wchar_t nullptr_t auto
hi def link cppType             cType
" inline virtual explicit export override final
hi def link cppModifier         cType

" static register auto volatile extern const
" inline __attribute__ restrict
" _Alignas alignas _Atomic _Noreturn noreturn _Thread_local
hi cStorageClass	guifg=#FFEE68
" mutable constexpr decltype thread_local
hi def link cppStorageClass     cStorageClass

" struct union enum typedef
hi cStructure           guifg=#8c8fd9
" class typename template namespace
hi def link cppStructure        cStructure

" Typedef       A typedef.
"
" UNUSED???
hi Typedef	        guifg=#FFEE68 guibg=#FF1F1F

" Vulkan handle types
hi cVulkanHandle        guifg=#FFB3BE

" ============================================================================
" * SPECIAL                                                                  *

" Escaped characters in string.
hi cSpecial	        guifg=#ecc909
" Printf formatting.
hi cFormat              guifg=#ecc909
" Not sure what this is.
"hi cSpecialCharacter    guifg=#ecc909 guibg=#FF1F1F

" Tag           You can use CTRL-] on this.
"
" UNUSED???
hi Tag	                guifg=#FFB539 guibg=#FF1F1F

" Delimiter     Character that needs attention.
"
" UNUSED???
hi cDelimiter	        guifg=#FFEC48 guibg=#FF1F1F

" SpecialComment Special things inside a comment.
"
" UNUSED???
hi SpecialComment	guifg=#FFB539 guibg=#FF1F1F

" Debug         Debugging statements.
"
" UNUSED???
hi Debug	        guifg=#c23eff
hi cwDebugLabel         guifg=#db8eff

" Trailing white space (needs "let c_space_errors=1" in .config/nvim/init.vim).
hi cSpaceError          guibg=#1f0000

" ============================================================================
" The following groups do not have minor groups.

" Underlined    Text that stands out, HTML links.
"
" Unused?
hi Underlined	        guifg=#FC4234 guibg=#FF1F1F

" Ignore        Left blank, hidden  hl-Ignore.
"
" Unused.
hi Ignore	        guifg=#1F1F1F guibg=#FF1F1F

" Error         Any erroneous construct.
"
" An error message like, "E163: There is only one file to edit" at the bottom of vim.
hi Error	        guibg=#FC4234
" "\\\s\+$"
hi cBadContinuation     guibg=#FC4234

" TODO FIXME XXX
hi cTodo                guibg=#FC4234 gui=bold

" Various C/C++ errors.
hi cError               guibg=#FC4234

" ============================================================================
" vim specific colors.

" ~ lines below text.
hi NonText	        guifg=#2f2f2f guibg=#202020 guisp=#202020 gui=NONE

" The (vim) status line of the active window.
hi StatusLine           guifg=#696567 guibg=#000000 guisp=#000000 gui=NONE

" The (vim) status line of non-active windows.
hi StatusLineNC         guifg=#696567 guibg=#25365a guisp=#25365a gui=NONE

" Highlighted text that matches the last reg.exp. search.
hi Search               guifg=NONE guibg=#754f22 guisp=#754f22 gui=NONE

" The vertical line between windows (:vsplit).
hi VertSplit	        guifg=#FFEE68

" ============================================================================

hi def link cwMacroTag cDefine
hi def link cwEnumTag cConstant
hi def link cwVariableTag Identifier
hi def link cwTypedefTag cType
hi def link cwEnumTypeTag cwTypedefTag
hi def link cwNamespaceTag cwTypedefTag
hi def link cwStructTag cwTypedefTag
hi def link cwUnionTag cwStructTag
hi def link cwClassTag cwStructTag
hi def link cwNestedClassTag cwClassTag
hi def link cwFunctionTag cFunction
hi def link cwMemberTag cwFunctionTag

" ============================================================================
" Other highlighting that I ran into.
hi markdownLinkText     guifg=#5353ff gui=underline
hi def link markdownError Error
