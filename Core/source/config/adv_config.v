/*
    adv_reg_01: // \
    adv_reg_02: //  |--> audio clock regeneration N
    adv_reg_03: // /
    adv_reg_17: // 02: 16:9, 00: 4:3
    adv_reg_56: // 28: 16:9, 18: 4:3
    adv_reg_3b: // C8: input pll x2, 80: input pll x1
    adv_reg_3c: // 00 | vic_manual
*/
const ADV7513Config ADV7513_CONFIG_1080P = {
    8'h_00, // adv_reg_01
    8'h_18, // adv_reg_02
    8'h_80, // adv_reg_03
    8'h_02, // adv_reg_17
    8'h_28, // adv_reg_56
    8'h_C8, // adv_reg_3b
    8'h_10  // adv_reg_3c
};

const ADV7513Config ADV7513_CONFIG_960P = {
    8'h_00, // adv_reg_01
    8'h_18, // adv_reg_02
    8'h_80, // adv_reg_03
    8'h_00, // adv_reg_17
    8'h_18, // adv_reg_56
    8'h_C8, // adv_reg_3b
    8'h_00  // adv_reg_3c
};

const ADV7513Config ADV7513_CONFIG_480P = {
    8'h_00, // adv_reg_01
    8'h_18, // adv_reg_02
    8'h_80, // adv_reg_03
    8'h_00, // adv_reg_17
    8'h_18, // adv_reg_56
    8'h_80, // adv_reg_3b
    8'h_02  // adv_reg_3c
};

const ADV7513Config ADV7513_CONFIG_VGA = {
    8'h_00, // adv_reg_01
    8'h_18, // adv_reg_02
    8'h_80, // adv_reg_03
    8'h_00, // adv_reg_17
    8'h_18, // adv_reg_56
    8'h_80, // adv_reg_3b
    8'h_01  // adv_reg_3c
};

const ADV7513Config ADV7513_CONFIG_240Px3 = {
    8'h_00, // adv_reg_01
    8'h_18, // adv_reg_02
    8'h_80, // adv_reg_03
    8'h_02, // adv_reg_17
    8'h_28, // adv_reg_56
    8'h_80, // adv_reg_3b
    8'h_04  // adv_reg_3c
};
