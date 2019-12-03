function xq = twosquant(x,w,rmode,omode)


if nargin ~= 4
    error('Usage: xq = twosquant(x, w, rmode, omode)');
end
if w <= 0
    error('Wordlength must be a positive integer');
end

struct.mode = 'fixed'; 
% format
struct.format = [w w-1];
% roundmode
if strcmp(rmode, 'r')              
   struct.roundmode = 'round';      
elseif strcmp(rmode, 't')          
  struct.roundmode = 'floor';       
else
    error('Unknown reduction mode');
end
% overflowmode
if strcmp(omode, 's')
    struct.overflowmode = 'saturate'; 
elseif strcmp(omode, 'o')   
   struct.overflowmode = 'wrap';
else
    error('Unknown overflow mode');
end

q = quantizer(struct); 
xq = quantize(q,x);
% EOF