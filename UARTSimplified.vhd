--	library ieee;
--		use ieee.std_logic_1164.all;
--		use ieee.Numeric_std.all;
--	entity UARTSimplified is
--	port( clk : in std_logic;
--          rst: in std_logic;
--					--  data_in : in unsigned(7 downto 0);
--			txnInd_top : out std_logic;
--		  baud_rate_top: in std_logic;
--		  RTS :in std_logic;
--		  serial_out:out std_logic
--		--baud96_top : out std_logic;
--		--baud1152_top : out std_logic
--		  );
--	end UARTSimplified;
--
--architecture TOP of UARTSimplified is 
--	component baud_gen is 
--		port( sysclk :in std_logic;
--			  rst : in std_logic;
--			  baud_rate: in std_logic;
--					--Baud Rate chosen from the system; 1 -> 9600; 0-> 115200  
--			   baudEnable:out std_logic
--				--	baud96 : out std_logic;
--		      -- baud1152 : out std_logic
--			);
--	end component;
--
--	component TXNCNTRL is 
--	port( sysclk : in std_logic;
--		  rst : in std_logic;
--		--  din : in unsigned(7 downto 0);
--			txnInd : out std_logic;
--		  baud_enable : in std_logic;
--		  RTS : in std_logic; -- Request to Send 
-- 		  d_out	: out std_logic
--		);
--	end component;
--		signal baudEnable_BaudGen_Cntrl : std_logic;
----		signal baud96_BaudGen_Cntrl: std_logic;
----		signal baud1152_BaudGen_Cntrl: std_logic;
--
--	begin
--	 		
--
--		
--		TXNCNTRL_BLK : entity work.TXNCNTRL port map( sysclk => clk,
--														  rst => rst,
--																--  din => data_in,
--															txnInd => txnInd_top,
--														  baud_enable => baudEnable_BaudGen_Cntrl,
--														  RTS	 => RTS, -- Request to Send 
--												 		  d_out	=> serial_out
--														);
--
--		Baud_Gen_Blk	: entity work.baud_gen port map(  sysclk => clk,
--														  rst => rst,
--															baud_rate => baud_rate_top,
--																--Baud Rate chossen from the system; 1 -> 9600; 0-> 115200  
--														  baudEnable	 => baudEnable_BaudGen_Cntrl
--										--					baud96 => baud96_top,
--										--					baud1152 => baud1152_top
--														);
--	end TOP;
	
	
	
	
		library ieee;
		use ieee.std_logic_1164.all;
		use ieee.Numeric_std.all;
	entity UARTSimplified is
	port( clk : in std_logic;
          rst: in std_logic;
					--  data_in : in unsigned(7 downto 0);
			txnInd_top : out std_logic;
		  baud_rate_top: in std_logic_vector(1 downto 0); 
		  RTS :in std_logic;
		  serial_out:out std_logic
		--baud96_top : out std_logic;
		--baud1152_top : out std_logic
		  );
	end UARTSimplified;

architecture TOP of UARTSimplified is 
	component baud_gen is 
		port( sysclk :in std_logic;
			  rst : in std_logic;
			  baud_rate: in std_logic_vector(1 downto 0); 
					--Baud Rate chosen from the system; 1 -> 9600; 0-> 115200  
			   baudEnable:out std_logic
				--	baud96 : out std_logic;
		      -- baud1152 : out std_logic
			);
	end component;

	component TXNCNTRL is 
	port( sysclk : in std_logic;
		  rst : in std_logic;
		--  din : in unsigned(7 downto 0);
			txnInd : out std_logic;
		  baud_enable : in std_logic;
		  RTS : in std_logic; -- Request to Send 
 		  d_out	: out std_logic
		);
	end component;
		signal baudEnable_BaudGen_Cntrl : std_logic;
--		signal baud96_BaudGen_Cntrl: std_logic;
--		signal baud1152_BaudGen_Cntrl: std_logic;

	begin
	 		

		
		TXNCNTRL_BLK : entity work.TXNCNTRL port map( sysclk => clk,
														  rst => rst,
																--  din => data_in,
															txnInd => txnInd_top,
														  baud_enable => baudEnable_BaudGen_Cntrl,
														  RTS	 => RTS, -- Request to Send 
												 		  d_out	=> serial_out
														);

		Baud_Gen_Blk	: entity work.baud_gen port map(  sysclk => clk,
														  rst => rst,
															baud_rate => baud_rate_top,
																--Baud Rate chossen from the system; 1 -> 9600; 0-> 115200  
														  baudEnable	 => baudEnable_BaudGen_Cntrl
										--					baud96 => baud96_top,
										--					baud1152 => baud1152_top
														);
	end TOP;