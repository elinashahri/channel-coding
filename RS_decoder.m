bits=csvread('C:\Users\techkala.ir\Downloads\bits19.csv');
SNRdb =(1:22);ber=zeros(1,25);
for k = SNRdb   
    filename = sprintf('C:\\Users\\techkala.ir\\Downloads\\received_QPSK%d.csv', k);  
    received_sym = csvread(filename); 
    received_sym=received_sym';
    received_symbols = uint32(received_sym);  
% Define GF order. Assuming GF(2^8) for this example  
    GF_order = 8;  
    % Create Galois Field GF(2^8)  
    GF = gf(0:255, GF_order);  
    % Convert received symbols to Galois Field elements  
    gf_received = gf(received_symbols, GF_order);  
    bitstream=[];
    for i = 1:15:length(gf_received)  
        coded_rs_symbols_block=gf_received(i:i+14);
        decoded_msg_rs_sym=rsdec( coded_rs_symbols_block,15,11);
        decoded_msg_rs_sym=double(decoded_msg_rs_sym.x);
        for j = 1:length(decoded_msg_rs_sym)  
            % Convert the symbol to a binary vector  
            byte = de2bi(decoded_msg_rs_sym(j), 8, 'left-msb'); 
            bitstream = [bitstream; byte(:)]; 
        end  

    end
    ber(k)=sum(xor(bits,bitstream))/length(bits);
end

% %% %for the receiver
% received_sym= csvread('C:\Users\techkala.ir\Downloads\received_QPSK23.csv');
% received_sym=received_sym';
% bits=csvread('C:\Users\techkala.ir\Downloads\bits19.csv');
% % Received symbols as uint32  
% received_symbols = uint32(received_sym);  
% % Define GF order. Assuming GF(2^8) for this example  
% 
% GF_order = 8;  
% % Create Galois Field GF(2^8)  
% GF = gf(0:255, GF_order);  
% % Convert received symbols to Galois Field elements  
% gf_received = gf(received_symbols, GF_order);  
% bitstream=[];
% for i = 1:15:length(gf_received)  
%     coded_rs_symbols_block=gf_received(i:i+14);
%     decoded_msg_rs_sym=rsdec( coded_rs_symbols_block,15,11);
%     decoded_msg_rs_sym=double(decoded_msg_rs_sym.x);
%     for j = 1:length(decoded_msg_rs_sym)  
%         % Convert the symbol to a binary vector  
%         byte = de2bi(decoded_msg_rs_sym(j), 8, 'left-msb'); % 'left-msb' means most significant bit first  
%         
%         % Concatenate the result to the bitstream  
%         bitstream = [bitstream; byte(:)]; % Ensure the byte is a column vector  
%     end  
%     
% end
% %each time run:
% %ber=zeros(1,25)
% %sum(xor(bits,bitstream))/length(bits) and save in ber(snr)
% 
