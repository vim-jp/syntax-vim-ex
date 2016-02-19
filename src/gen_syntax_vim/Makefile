#
# Makefile to update runtime/syntax/vim.vim
# 
# - First, Generate vim.vim.rc that is Release Candidate file to copy
#   runtime/syntax/vim.vim
# - vim.vim.rc is based on vim.vim.base and created from parses some source
#   code of Vim.
# - If different vim.vim.rc and runtime/syntax/vim.vim, Update the date
#   information of vim.vim.rc and copy it to runtime/syntax/vim.vim.

VIMPROG = ../vim
SYN_VIM_VIM = ../../runtime/syntax/vim.vim

SCRIPTS = gen_syntax_vim.vim update_date.vim

.PHONY: update clean eval_check

RM_ON_COMMON = chk_src chk_dst
RM_ON_START = $(RM_ON_COMMON) sanity_check.err generator.err
RM_ON_END = $(RM_ON_COMMON) noeval
RUN_VIM = $(VIMPROG) -N -u NONE -i NONE -n
EXCLUDE_PTN = "^\" Last Change:"

update: eval_check vim.vim.rc

clean:
	-@rm -f $(RM_ON_END) vim.vim.rc

vim.vim.rc: $(VIMPROG) $(SCRIPTS) vim.vim.base
	-@rm -f $(RM_ON_START)
	@if ! test -f noeval; then \
		$(RUN_VIM) -c "so gen_syntax_vim.vim"; \
		if test -f sanity_check.err; then \
			echo; \
			echo Vim sanity check Error; \
			cat sanity_check.err; \
			-rm -f $(VIMPROG); \
			exit 1; \
		fi; \
		if test -f generator.err; then \
			echo Generator Error; \
			cat generator.err; \
		else \
			grep -v $(EXCLUDE_PTN) vim.vim.rc > chk_src; \
			grep -v $(EXCLUDE_PTN) $(SYN_VIM_VIM) > chk_dst; \
			if ! diff -q chk_src chk_dst > /dev/null; then \
				$(RUN_VIM) -s update_date.vim; \
				cp -f vim.vim.rc $(SYN_VIM_VIM); \
				echo Update $(SYN_VIM_VIM); \
			fi; \
		fi; \
	fi
	-@rm -f $(RM_ON_END)

eval_check: eval_check.vim
	-@rm -f noeval
	@$(RUN_VIM) -s eval_check.vim
