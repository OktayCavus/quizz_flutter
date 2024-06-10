const baseApiUrl = 'http://10.0.2.2:8000/api/';

const loginUrl = '${baseApiUrl}user/login';

const registerUrl = '${baseApiUrl}user/create';

const logoutUrl = '${baseApiUrl}auth/logout';

const resetPasswordEmailUrl = '${baseApiUrl}user/password/email';

const checkResetCodeUrl = '${baseApiUrl}user/code/check';

const resetPasswordUrl = '${baseApiUrl}user/password/reset';

const currentUserUrl = '${baseApiUrl}auth/me';

const updateProfileUrl = '${baseApiUrl}auth/update';

const changeEmailCodeUrl = '${baseApiUrl}user/change/email/code';

const checkChangeEmailUrl = '${baseApiUrl}user/code/email/check';

const changeEmailUrl = '${baseApiUrl}user/change/email';

const answersUrl = '${baseApiUrl}questions/get-test-answer';

const testCategoriesUrl = '${baseApiUrl}questions/get_test_with_category';

const selectedQuestionUrl = '${baseApiUrl}questions/get-selected-question';

const listTestUrl = '${baseApiUrl}questions/get-question-with-test';

const allCategoryUrl = '${baseApiUrl}tests/get-all-category';

const getCategoryTestUrl = '${baseApiUrl}tests/get-category';

const submitAnswersUrl = '${baseApiUrl}questions/submit-answer';

const getUserTestsUrl = '${baseApiUrl}tests/show-user-test/';

const getTestCategoryAnswerUrl =
    '${baseApiUrl}questions/get-test-category-answer/';
