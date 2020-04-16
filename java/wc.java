public class wc {
	private static boolean isspace(byte b){
		/**
		* Not one of  ' ', '\n', '\t', '\v', '\f', '\r'
		*/
		return b == 0x20
			|| b == 0x0A
			|| b == 0x09
			|| b == 0x0B
			|| b == 0x0C
			|| b == 0x0D;
	}
    public static void main(String[] args) {
        int word_count = 0;
        int b;
        boolean in_space = true;

    	try{
			while ((b = System.in.read()) != -1){
				if(isspace((byte) b))
					in_space = true;
				else {
					if(in_space)
						++word_count;
					in_space = false;
				}
			}
    	}
    	catch(Exception e){
			System.err.println("not a tty");
			System.exit(1);
    	}

        System.out.println(word_count);
    }
}