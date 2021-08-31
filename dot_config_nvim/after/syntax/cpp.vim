" Highlight my debug macros.

" A group with things that are normally already excluded from cParen.
syn cluster cwNotInParen contains=@cParenGroup,cCppParen,cErrInBracket,cCppBracket,@cStringGroup,@Spell

" A group that of things that are contained, but not because they are between parens.
syn cluster cwNotInParen2 contains=cwDoxyCommentLead

" Create a new cParen syntax group that will have Debug highlighting.
syn region cwDebugParen transparent matchgroup=cwDebugParenDelim contains=ALLBUT,@cwNotInParen,@cwNotInParen2
\       start='(' end=')'me=s-1

" Add a syntax group for "Debug( ... );".
syn region cwDebugMacros transparent matchgroup=cwDebugMacrosDelim contains=cwDebugParen
\       start="\v\W(Debug|LibcwDebug|Dout(Fatal|Entering|)|LibcwDout(Fatal|)|ASSERT|assert|CWDEBUG_ONLY|COMMA_CWDEBUG_ONLY|NEW|AllocTag([12]?|_dynamic_description)|ForAllDebug(Channels|Objects))\(@="hs=s+1
\       start="\v^(Debug|LibcwDebug|DoutFatal|DoutEntering|Dout|LibcwDoutFatal|LibcwDout|ASSERT|assert|CWDEBUG_ONLY|COMMA_CWDEBUG_ONLY|NEW|AllocTag[12]?|AllocTag_dynamic_description|ForAllDebugChannels|ForAllDebugObjects)\(@="
\       end="\v\);?"

" Define cParen last, so it will overrule the previous one.
syn clear cParen
syn region cParen transparent contains=ALLBUT,@cwNotInParen,@cwNotInParen2,cwDebugParen
\       start='(' end=')'

" Redefine cCppParen to also exclude cwDebugParen.
syn clear cCppParen
syn region cCppParen transparent contained contains=ALLBUT,@cParenGroup,cErrInBracket,cParen,cwDebugParen,cBracket,cString,@Spell
\       start='(' skip='\\$' excludenl end=')' end='$'

" Redefine cCppBracket to also exclude cwDebugParen.
syn clear cCppBracket
syn region cCppBracket transparent contained contains=ALLBUT,@cParenGroup,cErrInParen,cParen,cwDebugParen,cBracket,cString,@Spell
\       start='\[\|<::\@!' skip='\\$' excludenl end=']\|:>' end='$'

syn keyword cwDebugMacro NAMESPACE_DEBUG_CHANNELS_START
syn keyword cwDebugMacro NAMESPACE_DEBUG_CHANNELS_END
syn keyword cwDebugMacro NAMESPACE_DEBUG
syn keyword cwDebugMacro NAMESPACE_DEBUG_START
syn keyword cwDebugMacro NAMESPACE_DEBUG_END
syn keyword cwDebugMacro DEBUGCHANNELS

" Add syntax group for "function(void)".
syn region cwVoidArgumentRegion matchgroup=cwVoidArgument contains=None
\       start="\w(void)"hs=s+1
\       end="."he=e-1

" Add syntax group for doxygen comments.
syn region cwDoxyCommentRegion matchgroup=cwDoxyComment contains=None
\       start="///"
\       end='$'
syn region cwDoxyCommentBlockRegion matchgroup=cwDoxyComment contains=cwDoxyCommentLead
\       start="/\*\*[^ ]*" excludenl
\       end="^ *\*/" end="\*/"
syn match cwDoxyCommentLead "^ *\*[^/ ]*" contained

hi def link cwDebugMacrosDelim Debug       " Highlight 'Debug' and the close paren of that macro.
hi def link cwDebugParenDelim Debug        " Highlight the open paren of the Debug macro.
hi def link cwVoidArgument cError          " Style: Highlight '(void)' because that should always be '()'.
hi def link cwDebugMacro Debug             " Highlight debug macros without arguments.

hi def link cwDoxyComment            cDoxygenCommentLead    " Highlight doxygen comments.
hi def link cwDoxyCommentLead        cDoxygenCommentLead    " Highlight doxygen comments.
hi def link cwDoxyCommentRegion      cDoxygenComment        " Highlight doxygen comments.
hi def link cwDoxyCommentBlockRegion cDoxygenComment        " Highlight doxygen comments.

" Add syntax group for vulkan types that are handles.

" The regular expression was generated with:
" RE=$(egrep '^(VK_DEFINE_NON_DISPATCHABLE_HANDLE|VK_DEFINE_HANDLE)' Vulkan-Hpp/Vulkan-Headers/include/vulkan/vulkan_core.h |
"     sed -e 's/.*(\([^)]*\)).*/\1/;s/^Vk//' | sort | awk '{ printf("%s|", $0); }' | sed -e 's/^/(/;s/|$/)/')
"
" For this to work there should not exist a keyword 'vk'. Aka, no `syn keyword cwNamespaceTag vk`!

syn match cwNameSpaceTag "\v<vk>"
syn match cwVulkanHandle "\v<vk::(AccelerationStructureKHR|AccelerationStructureNV|Buffer|BufferView|CommandBuffer|CommandPool|CuFunctionNVX|CuModuleNVX|DebugReportCallbackEXT|DebugUtilsMessengerEXT|DeferredOperationKHR|DescriptorPool|DescriptorSet|DescriptorSetLayout|DescriptorUpdateTemplate|Device|DeviceMemory|DisplayKHR|DisplayModeKHR|Event|Fence|Framebuffer|Image|ImageView|IndirectCommandsLayoutNV|Instance|PerformanceConfigurationINTEL|PhysicalDevice|Pipeline|PipelineCache|PipelineLayout|PrivateDataSlotEXT|QueryPool|Queue|RenderPass|Sampler|SamplerYcbcrConversion|Semaphore|ShaderModule|SurfaceKHR|SwapchainKHR|ValidationCacheEXT)>"hs=s+4 contains=cwNamespaceTag
syn match cwVulkanHandle "\v<Vk(AccelerationStructureKHR|AccelerationStructureNV|Buffer|BufferView|CommandBuffer|CommandPool|CuFunctionNVX|CuModuleNVX|DebugReportCallbackEXT|DebugUtilsMessengerEXT|DeferredOperationKHR|DescriptorPool|DescriptorSet|DescriptorSetLayout|DescriptorUpdateTemplate|Device|DeviceMemory|DisplayKHR|DisplayModeKHR|Event|Fence|Framebuffer|Image|ImageView|IndirectCommandsLayoutNV|Instance|PerformanceConfigurationINTEL|PhysicalDevice|Pipeline|PipelineCache|PipelineLayout|PrivateDataSlotEXT|QueryPool|Queue|RenderPass|Sampler|SamplerYcbcrConversion|Semaphore|ShaderModule|SurfaceKHR|SwapchainKHR|ValidationCacheEXT)>"

hi def link cwVulkanHandle cVulkanHandle                    " Highlight vulkan handle types.
