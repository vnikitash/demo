<?php

class TestAPICest
{
    public function signUpTest(ApiTester $I)
    {
        $I->haveHttpHeader('X-Localisation', 'en_ch');
        $I->sendPOST('/api/v1/signup', $this->correctArrayData);
        $I->seeResponseCodeIs(\Codeception\Util\HttpCode::CREATED);
    }
}
