
#[test_only]
module tensorflowsui::Inference_tests {
    use tensorflowsui::Tensor_test::{ Tensor, SignedFixedTensor, from_input, debug_print_tensor};
    use tensorflowsui::Graph_tests;
    use tensorflowsui::Model_tests;

    use std::debug;
    // use sui::test_utils::print

    // #[test]
    // fun test_check(){
    //     use sui::test_scenario;

    //         let chk_input :vector<u64> = vector[1,2,3];

    //         run(chk_input);




    // }

        /// 1) 테스트 함수: 여기서 (magnitude, sign, scale) 을 직접 넘김
    #[test]
    fun test_check2() {
        // (예) +1.23, -4.56, +7.89  => magnitude=[123,456,789], sign=[0,1,0], scale=2
       let scale = 2;
        
        // label 0
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 96, 1, 0, 0, 0, 33, 62, 29, 45, 0, 0, 0, 50, 0, 0, 88, 0, 0, 17, 0, 0, 54, 7, 0, 0, 11, 97, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 1
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 12, 0, 0, 0, 0, 0, 93, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 28, 62, 0, 0, 0, 0, 0, 97, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 2
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 71, 0, 0, 0, 0, 77, 65, 61, 0, 0, 0, 0, 1, 72, 92, 0, 0, 0, 14, 54, 66, 31, 73, 0, 0, 55, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 3
        let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 85, 99, 17, 0, 0, 0, 3, 0, 56, 32, 0, 0, 0, 62, 93, 90, 0, 0, 0, 0, 0, 0, 99, 0, 0, 0, 90, 76, 94, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 4
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 66, 0, 0, 0, 99, 0, 0, 95, 0, 0, 0, 51, 60, 87, 99, 0, 0, 0, 6, 67, 0, 99, 2, 0, 0, 0, 0, 0, 33, 57, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 5
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 53, 25, 0, 0, 0, 0, 25, 33, 6, 0, 0, 0, 8, 0, 45, 0, 0, 0, 0, 28, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 6
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 44, 0, 0, 0, 0, 4, 89, 0, 0, 0, 0, 0, 59, 92, 43, 0, 0, 0, 0, 49, 89, 90, 30, 0, 0, 0, 0, 61, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 7
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 39, 39, 71, 0, 0, 0, 0, 0, 0, 54, 16, 0, 0, 3, 74, 52, 10, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 8
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 30, 37, 0, 0, 0, 50, 3, 89, 0, 0, 0, 0, 0, 99, 5, 0, 0, 0, 0, 63, 5, 46, 0, 0, 0, 0, 97, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // // label 9
        // let input_mag = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 46, 0, 0, 0, 0, 12, 8, 75, 0, 0, 0, 0, 0, 85, 30, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0];
        // let input_sign  = vector[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];




        




        run(input_mag, input_sign, scale);
    }

 public fun run(
        input_magnitude: vector<u64>,
        input_sign: vector<u64>,
        scale: u64
    ) {
        // -----------------------------
        // (A) 고정소수점 그래프 생성
        // -----------------------------
        let mut graph_sf = Graph_tests::create_signed_graph();

        // -----------------------------
        // (B) 모델 생성 (dense1, dense2, output)
        //     shape: [3,6], [6,4], [4,2]
        // -----------------------------
        Model_tests::create_model_signed_fixed(&mut graph_sf, scale);

        // -----------------------------
        // (C) 가중치(Weight/Bias) 업로드
        //     여기서 ± 및 소수점(scale=2) 예시를 섞어서 작성
        // -----------------------------
        // 1) dense1 => shape=[3,6], bias=[6]
        // 예) w1_mag, w1_sign 에 임의로 부호 + 값 섞기
        let w1_mag = vector[23, 19, 8, 119, 5, 113, 23, 43, 41, 21, 5, 108, 9, 82, 16, 9, 25, 144, 162, 475, 212, 343, 50, 38, 304, 143, 490, 389, 499, 346, 71, 102, 6, 117, 10, 803, 41, 54, 145, 207, 150, 522, 589, 177, 256, 95, 395, 190, 644, 88, 105, 721, 21, 74, 333, 141, 87, 13, 143, 21, 207, 58, 90, 166, 496, 44, 160, 565, 83, 219, 143, 98, 121, 133, 109, 52, 246, 111, 103, 375, 522, 54, 172, 867, 353, 113, 46, 128, 327, 817, 197, 42, 126, 191, 526, 206, 26, 42, 152, 146, 4, 266, 266, 21, 89, 2, 340, 375, 85, 293, 260, 238, 201, 365, 335, 69, 357, 47, 66, 61, 32, 86, 161, 280, 156, 51, 316, 86, 26, 17, 4, 15, 120, 29, 21, 76, 39, 8, 63, 35, 45, 22, 36, 119, 3, 19, 6, 5, 76, 15, 5, 58, 1, 3, 129, 65, 4, 4, 8, 176, 0, 21, 21, 35, 35, 24, 4, 7, 0, 58, 22, 34, 99, 11, 4, 490, 38, 11, 85, 82, 81, 82, 11, 14, 30, 52, 15, 27, 89, 68, 8, 85, 8, 31, 92, 94, 23, 94, 136, 1, 87, 6, 39, 128, 99, 41, 33, 26, 171, 73, 44, 87, 249, 237, 611, 17, 62, 120, 85, 31, 623, 406, 56, 24, 5, 71, 47, 251, 92, 183, 135, 161, 48, 368, 195, 155, 141, 252, 224, 11, 148, 5, 20, 136, 232, 9, 31, 75, 92, 19, 145, 25, 11, 0, 24, 66, 97, 19, 2, 94, 164, 3, 117, 30, 84, 34, 82, 14, 64, 33, 2, 18, 7, 12, 29, 2, 167, 78, 12, 8, 41, 14, 13, 18, 63, 29, 5, 144, 43, 10, 26, 66, 10, 226, 42, 11, 6, 24, 58, 4, 24, 2, 3, 46, 0, 8, 14, 70, 9, 440, 79, 39, 7, 47, 38, 63, 54, 5, 12, 21, 619, 16, 94, 54, 17, 299, 363, 154, 222, 5, 50, 91, 323, 495, 116, 154, 73, 16, 67, 177, 373, 1, 123, 147, 118, 82, 134, 130, 199, 103, 246, 23, 214, 105, 43, 32, 10, 5, 99, 31, 38, 59, 2, 15, 20, 42, 2, 2, 114, 53, 8, 23, 11, 7, 88, 14, 62, 47, 30, 2, 45, 28, 1, 3, 47, 54, 13, 16, 25, 17, 86, 43, 28, 158, 1, 36, 36, 29, 36, 17, 20, 21, 16, 30, 13, 53, 50, 55, 63, 23, 35, 9, 13, 55, 4, 3, 27, 23, 40, 10, 38, 16, 3, 565, 70, 40, 11, 65, 45, 74, 34, 16, 48, 235, 267, 42, 27, 32, 140, 165, 93, 61, 33, 174, 28, 203, 1, 28, 185, 246, 262, 117, 80, 485, 220, 45, 84, 129, 0, 43, 287, 104, 94, 173, 46, 357, 27, 75, 51, 13, 73, 10, 130, 36, 0, 65, 70, 104, 9, 6, 14, 235, 6, 23, 19, 6, 79, 24, 14, 60, 28, 29, 3, 13, 12, 25, 21, 87, 91, 41, 32, 3, 5, 26, 39, 128, 6, 25, 20, 6, 57, 5, 22, 30, 11, 9, 7, 15, 15, 38, 114, 31, 14, 14, 88, 15, 74, 2, 8, 9, 48, 58, 56, 21, 34, 732, 110, 4, 56, 34, 55, 46, 58, 58, 38, 195, 882, 63, 114, 29, 113, 57, 176, 58, 88, 315, 182, 88, 90, 12, 142, 128, 140, 71, 161, 133, 214, 39, 210, 178, 335, 29, 55, 156, 76, 33, 53, 156, 52, 15, 48, 0, 12, 8, 41, 30, 243, 65, 44, 73, 59, 78, 9, 70, 48, 10, 19, 1, 33, 3, 42, 52, 83, 60, 50, 28, 31, 25, 1, 12, 113, 43, 27, 17, 8, 14, 71, 67, 26, 10, 67, 54, 62, 11, 9, 14, 41, 12, 18, 14, 2, 14, 88, 73, 63, 59, 105, 0, 265, 17, 64, 35, 41, 26, 80, 14, 98, 547, 100, 107, 44, 68, 235, 1, 72, 15, 130, 106, 573, 102, 188, 15, 85, 197, 216, 13, 101, 152, 84, 112, 50, 15, 19, 333, 282, 291, 56, 39, 131, 231, 437, 223, 271, 370, 339, 6, 121, 263, 96, 139, 276, 95, 4, 116, 253, 83, 106, 151, 49, 139, 92, 21, 227, 286, 1, 69, 166, 177, 85, 86, 22, 8, 59, 179, 95, 52, 96, 110, 239, 28, 10, 36, 100, 214, 87, 54, 12, 13, 17, 10, 98, 125, 4, 80, 100, 11, 56, 6, 320, 141, 47, 53, 64, 237, 16, 9, 132, 662, 43, 32, 429, 16, 174, 176, 183, 133, 24, 109, 82, 115, 229, 37, 51, 414, 188, 139, 54, 65, 38, 82, 173, 15, 58, 15, 26, 148, 242, 84, 181, 74, 46, 134, 21, 68];
        let w1_sign= vector[1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0];
        // => 예: w1_mag[0]=150 + w1_sign[0]=0 => +1.50
        //        w1_mag[1]=234 + w1_sign[1]=1 => -2.34
        //        ... (소수점은 scale=2)
        
        let b1_mag = vector[36, 8, 22, 59, 1, 1, 91, 41, 13, 11, 89, 65, 43, 81, 10, 10];
        let b1_sign= vector[1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // => +1.00, -2.34, +0.99, +0.50, +0.12, +0.77

        Graph_tests::set_layer_weights_signed_fixed(
            &mut graph_sf,
            b"dense1",
            w1_mag, w1_sign,
            b1_mag, b1_sign,
            49, 16, // in_dim=3, out_dim=6
            scale
        );

        // 2) dense2 => shape=[6,4], bias=[4]
        let w2_mag = vector[111, 106, 134, 40, 18, 77, 4, 65, 34, 126, 46, 35, 134, 32, 12, 178, 47, 71, 45, 43, 43, 147, 144, 39, 15, 113, 39, 72, 67, 59, 137, 125, 80, 3, 110, 143, 28, 134, 73, 10, 231, 152, 54, 61, 18, 14, 30, 16, 130, 56, 9, 48, 52, 9, 80, 124, 110, 169, 86, 16, 150, 61, 61, 3, 38, 86, 80, 89, 30, 63, 71, 113, 28, 3, 168, 16, 114, 103, 102, 104, 65, 59, 60, 169, 40, 68, 80, 56, 4, 62, 62, 28, 116, 63, 49, 112, 3, 16, 113, 17, 99, 100, 95, 15, 41, 159, 80, 19, 39, 13, 86, 35, 25, 104, 46, 14, 183, 72, 56, 161, 79, 123, 113, 258, 59, 122, 161, 97];
        // 전부 6*4=24개
        let w2_sign= vector[1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1];

        let b2_mag = vector[57, 15, 27, 23, 56, 68, 19, 61];
        let b2_sign= vector[1, 1, 0, 0, 0, 0, 1, 0];


        Graph_tests::set_layer_weights_signed_fixed(
            &mut graph_sf,
            b"dense2",
            w2_mag, w2_sign,
            b2_mag, b2_sign,
            16, 8, // in_dim=3, out_dim=6
            scale
        );


        // => scale=2 => -1.20, +3.40, +5.60, -7.80, ...
        let w3_mag = vector[94, 99, 90, 139, 57, 111, 131, 34, 44, 68, 98, 45, 52, 66, 70, 141, 16, 71, 2, 31, 103, 162, 153, 43, 52, 24, 113, 154, 54, 80, 104, 48, 38, 3, 197, 40, 195, 88, 5, 46, 16, 82, 161, 52, 12, 44, 74, 73, 8, 43, 134, 177, 38, 31, 75, 45, 67, 44, 63, 41, 22, 27, 30, 87, 88, 45, 113, 145, 39, 66, 168, 208, 22, 24, 109, 11, 212, 81, 100, 89];
        // 전부 6*4=24개
        let w3_sign= vector[0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0];


        let b3_mag = vector[118, 304, 87, 260, 77, 19, 82, 17, 375, 151];
        let b3_sign= vector[1, 0, 0, 0, 0, 1, 0, 0, 1, 1]; // +0.11, -0.22

        Graph_tests::set_layer_weights_signed_fixed(
            &mut graph_sf,
            b"output",
            w3_mag, w3_sign,
            b3_mag, b3_sign,
            8,10,
            scale
        );

        // -----------------------------
        // (D) 입력 텐서 생성
        //     shape=[1,3], magnitude=input_magnitude, sign=input_sign
        // -----------------------------
        let inp_shape = vector[1,49];
        let input_tensor = from_input(inp_shape, input_magnitude, input_sign, scale);

        debug::print(&std::string::utf8(b"[fixed] input tensor: "));
        debug_print_tensor(&input_tensor);

        // -----------------------------
        // (E) 추론
        // -----------------------------
        let result = Model_tests::run_inference_signed_fixed(&input_tensor, &graph_sf);

        // -----------------------------
        // (F) 결과 확인
        // -----------------------------
        debug::print(&std::string::utf8(b"[fixed] output tensor: "));
        debug_print_tensor(&result);
    }


    // fun run(inputs: vector<u64>): Tensor {
        
    //     std::debug::print(&std::string::utf8(b"run inputs:"));
    //     debug::print(&inputs);

    //     // debug::print_stack_trace();
    //     // 1. graph init
    //     let mut graph = Graph_tests::create();
    //     std::debug::print(&std::string::utf8(b"run graph init:"));
    //     debug::print(&graph);

    //     // 2. create model
    //     Model_tests::create_model(&mut graph);

    //     std::debug::print(&std::string::utf8(b"run graph after create model:"));
    //     debug::print(&graph);



    //     // 3. weight upload
    //     std::debug::print(&std::string::utf8(b"before set weights dense1"));
    //     debug::print(&graph);
    //     Graph_tests::set_layer_weights(&mut graph, b"dense1", vector[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], vector[1, 1, 1, 1, 1, 1]);
    //     std::debug::print(&std::string::utf8(b"after set weights dense1"));
    //     debug::print(&graph);
    //     Graph_tests::set_layer_weights(&mut graph, b"dense2", vector[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], vector[1, 1, 1, 1]);
    //     Graph_tests::set_layer_weights(&mut graph, b"output", vector[1, 2, 3, 4, 5, 6, 7, 8], vector[1, 1]);
        
        
    //     // 4. model inference
    //     let output_tensor2 = Model_tests::run_inference(inputs, &graph);

    //     // 5. debugging
    //     let result = get_data(&output_tensor2);

    //     std::debug::print(&std::string::utf8(b"model resuls:"));
    //     debug::print(&result);
        
    //     output_tensor2

    // }


}