module FSM_tb();


// Señales de prueba
reg  clk;
reg  reset;
reg  data_in;
wire  data_out;


// Instanciación del DUT
FSM  DUT(
.clk(clk),
.reset(reset),
.data_in(data_in),
.data_out(data_out)
);

// Generación de reloj
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Período de 10 unidades de tiempo
end 


// Secuencia de prueba
initial
begin
// 
#20
reset = 1;
data_in = 0;
#24
reset = 0; // Activar reset
#3
reset = 1; // Desactivar reset
#10
    repeat (30) 
    begin
        data_in = $random % 2; // Entrada aleatoria
        #10;
    end
$finish;
end

initial 
begin
    $dumpfile("FSM_tb.vcd");
    $dumpvars(0, FSM_tb);
end

//Monitor
initial 
begin
    $monitor("Tiempo: %0d | reset: %b | data_in: %b | data_out: %b", $time, reset, data_in, data_out);
end   


endmodule 