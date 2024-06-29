// SPDX-License-Identifier: GPL-2.0-or-later
/*
 * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
 * Copyright (c) Linux Test Project, 2021-2024
 */

/*
 * Test macros:
 *
 * - TST_EXP_FAIL
 * - TST_EXP_FAIL_ARR
 * - TST_EXP_FAIL2
 * - TST_EXP_FAIL2_ARR
 * - TST_EXP_FAIL_PTR_NULL
 * - TST_EXP_FAIL_PTR_NULL_ARR
 * - TST_EXP_FAIL_PTR_VOID
 * - TST_EXP_FAIL_PTR_VOID_ARR
 */

#include "tst_test.h"

static int fail_fn(void)
{
	errno = EINVAL;
	return -1;
}

static int pass_fn(void)
{
	return 0;
}

static int inval_ret_fn(void)
{
	return 42;
}

static char *fail_fn_null(void)
{
	errno = EINVAL;
	return NULL;
}

static char *fail_fn_void(void)
{
	errno = EINVAL;
	return (void *)-1;
}

static char *inval_ret_fn_char(void)
{
	return (void *)-1;
}

static char *pass_fn_char(void)
{
	return "pass";
}

#define TEST_MACRO(macro, macro_arr, fail_fn, pass_fn, inval_fn) \
	do { \
		tst_res(TINFO, "Testing " #macro " macro"); \
		macro(fail_fn(), EINVAL, #fail_fn"()"); \
		tst_res(TINFO, "TST_PASS = %i", TST_PASS); \
		macro(fail_fn(), ENOTTY); /* skip msg parameter */ \
		tst_res(TINFO, "TST_PASS = %i", TST_PASS); \
		macro(pass_fn(), ENOTTY, #pass_fn"()"); \
		tst_res(TINFO, "TST_PASS = %i", TST_PASS); \
		macro(inval_fn(), ENOTTY, #inval_fn"()"); \
		tst_res(TINFO, "TST_PASS = %i", TST_PASS); \
		macro_arr(fail_fn(), exp_errs_pass, ARRAY_SIZE(exp_errs_pass), #fail_fn"()"); \
		tst_res(TINFO, "TST_PASS = %i", TST_PASS); \
		macro_arr(fail_fn(), exp_errs_fail, ARRAY_SIZE(exp_errs_fail)); /* skip msg parameter */ \
		tst_res(TINFO, "TST_PASS = %i", TST_PASS); \
	} while (0)

static void do_test(void)
{
	const int exp_errs_pass[] = {ENOTTY, EINVAL};
	const int exp_errs_fail[] = {ENOTTY, EISDIR};

	TEST_MACRO(TST_EXP_FAIL, TST_EXP_FAIL_ARR, fail_fn, pass_fn, inval_ret_fn);
	TEST_MACRO(TST_EXP_FAIL2, TST_EXP_FAIL2_ARR, fail_fn, pass_fn, inval_ret_fn);
	TEST_MACRO(TST_EXP_FAIL_PTR_NULL, TST_EXP_FAIL_PTR_NULL_ARR, fail_fn_null,
			   pass_fn_char, inval_ret_fn_char);
	TEST_MACRO(TST_EXP_FAIL_PTR_VOID, TST_EXP_FAIL_PTR_VOID_ARR, fail_fn_void,
			   pass_fn_char, inval_ret_fn_char);
}

static struct tst_test test = {
	.test_all = do_test,
};
