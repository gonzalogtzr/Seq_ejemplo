// 00 - Salida = 1
// 01 - Salida = 0
// 10 - Salida = 0
// 11 - Salida = 1

// 1 entrada, 1 salida 
// 4 estados

// Reset activo en bajo (Rst == 0)

module FSM (
    input  clk,
    input  reset,
    input  data_in,
    output reg data_out
);


// Definición de estados
parameter   State0 = 0,
            State1 = 1,
            State2 = 2,
            State3 = 3;

reg [1:0] current_state, next_state;

// Lógica de transición de estados
always @(posedge clk or negedge reset) 
begin
    if (reset == 0) //!reset
        current_state <= State0; // Estado inicial
    else
        current_state <= next_state;    
end

// 1 always para cambio de estado
always @(*) //(current_state, data_in)
begin
    case(current_state)
        State0:
        begin
            if(x==1)
                next_state = State1;
            else
                next_state = State0;
        end
        State1:
        begin
            if(x==1)
                next_state = State1;
            else
                next_state = State2;
        end
        State2:
        begin
            if(x==1)
                next_state = State3;
            else
                next_state = State2;
        end
        State3:
        begin
            if(x==1)
                next_state = State0;
            else
                next_state = State3;
        end
        default:
            next_state = State0; //El estado de default sea igual al estado de reset
    endcase 
end


// Segundo always para cambio de salidas
always @(*) //(current_state, data_in)
begin

    data_out = 0; //Valor por default

    case(current_state)
        State0:
            data_out = 1;
        State1:
            data_out = 0;
        State2:
            data_out = 0;
        State3:
            data_out = 1;
        default:
            data_out = 0; //Valor por default
    endcase 
end


endmodule 
