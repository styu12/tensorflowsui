module tensorflowsui::Inference {
    use tensorflowsui::Tensor::{ Tensor, get_data, get_shape};
    use tensorflowsui::Graph;
    use tensorflowsui::Model;
    // use std::debug::print;
    use sui::event;

    public struct Result has copy, drop {
    result: vector<u64>
}

    // public fun run(input: vector<u64>): Tensor {
            public fun run(input: vector<u64>) {
        // 1. 그래프 생성
        let mut graph = Graph::create();

        // 2. model 
        // let output_tensor = Model::model(input, &mut graph);

        Model::create_model(&mut graph);


        // 3. weight upload
        Graph::set_layer_weights(&mut graph, b"dense1", vector[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], vector[1, 1, 1, 1, 1, 1]);
        Graph::set_layer_weights(&mut graph, b"dense2", vector[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], vector[1, 1, 1, 1]);
        Graph::set_layer_weights(&mut graph, b"output", vector[1, 2, 3, 4, 5, 6, 7, 8], vector[1, 1]);

        // let output_tensor2 = Model::model(input, &mut graph);
        // let output_tensor2 = Model::run_inference(input, &mut graph);

        // // 4. 결과 디버깅 및 반환

        // let result = get_data(&output_tensor2);
        
        // // std::debug::print(&p);
        // event::emit(Result {result});

        // sample_tensor = Tensor::create
        // output_tensor2

        // sui::event::emits(output)



    }


}
