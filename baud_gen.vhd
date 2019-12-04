--	library ieee;
--		use ieee.std_logic_1164.all;
--		use ieee.Numeric_std.all;
--entity baud_gen is 
--	port( sysclk :in std_logic;
--		  rst : in std_logic;
--		  baud_rate: in std_logic; 
--			--Baud Rate chossen from the system; 1 -> 9600; 2-> 115200; 3-> 19200; 4 -> 25600;
--		  baudEnable:buffer std_logic
--		--  baud96 : out std_logic;
--		--  baud1152 : out std_logic
--		);
--end baud_gen;
--
--architecture rtl of baud_gen is 
--		
--		signal count :  integer range 0 to 6000 := 0; 
--   	signal count_1152 :  integer range 0 to 2000 := 0; 
--	begin
--		--baudEnable <= enable_96 or enable_1152;
--			--baud96 <= '1' when  ((rst = '0'))else '0';--baud_rate = '0' and 
--			--baud1152 <= '1' when  ((baud_rate = '1' and rst = '0'))else '0';
--		 process(sysclk,rst)
--				begin
--				  
--					 if(rst ='1')then
--						count <= 0;
--						baudEnable <= '0';
--						--baud96 <= '0';
--						--baud1152 <= '0';
--         		  	 elsif(rising_edge(sysclk))then
--							case(baud_rate) is 
--						when '0' => 
----
--							   if(count = (5208))then
--								baudEnable <= '1';
--								count <= 0;
--								else
--								--	baud96 <= '1';
--		Count_9600_Baud: 		baudEnable <= '0';
--								count <= count + 1;
--							   end if;
--
--								
--								
--					    when others =>	
--
--							   if(count = (434))then
--								baudEnable <= '1';
--								count <= 0;
--									else
--										--baud1152 <= '1';
--		Count_1152_Baud : 		baudEnable <= '0';
--								count <= count + 1;									
--							   end if;
------						
------						when "10" => 
----		Count_19200_Baud : 		baudEnable <= '0';
----								count <= count + 1;
----							   if(count = 625)then
----								baudEnable <= '1';
----								count <= 0;
----							   end if;
----						when others => 
----										baudEnable <= '0';
----	Count_25600_Baud : 			count <= count + 1;
----							   if(count = 47)then
----								baudEnable <= '1';
----								count <= 0;
----							   end if;
--				   	end case;
--				 end if;  
--				
--			end process;	
--end rtl;

---------------------------------------------------------------------------------------------------------------------------
--														Alternate version
--------------------------------------------------------------------------------------------------------------------------
--entity baud_gen is 
--	generic( countrange : integer := 9600);
--	port( sysclk :in std_logic;
--		  rst : in std_logic;
--		  baud_rate: in integer range 1 to 4; 
--		  baudEnable:out std_logic	
--		);
--end baud_gen;
--
--architecture rtl of baud_gen is 
--		
--		signal count :  integer range 0 to 2000 := 0; 
--	
--	begin
--
--		 process(sysclk)
--				begin
--				  if(rising_edge(sysclk))then
--					 if(rst ='1')then
--						count <= 0;
--						baudEnable <= '0';
--						
--         		  	 else
--						
--						
--		Count_9600_Baud: 		baudEnable <= '0';
--								count <= count + 1;
--							   if(count = countrange)then
--								baudEnable <= '1';
--								count <= 0;
--							   end if;
--
--					   
--					 end if;  
--				end if;
--			end process;	
--end rtl;
----------------------------------------------------------------------------------------------------------------





	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.Numeric_std.all;
entity baud_gen is 
	port( sysclk :in std_logic;
		  rst : in std_logic;
		  baud_rate: in std_logic_vector(1 downto 0); 
			--Baud Rate chossen from the system; 1 -> 9600; 2-> 115200; 3-> 19200; 4 -> 25600;
		  baudEnable:buffer std_logic
		--  baud96 : out std_logic;
		--  baud1152 : out std_logic
		);
end baud_gen;

architecture rtl of baud_gen is 
		
		signal count :  integer range 0 to 6000 := 0; 
   	signal count_1152 :  integer range 0 to 2000 := 0; 
	begin
		--baudEnable <= enable_96 or enable_1152;
			--baud96 <= '1' when  ((rst = '0'))else '0';--baud_rate = '0' and 
			--baud1152 <= '1' when  ((baud_rate = '1' and rst = '0'))else '0';
		 process(sysclk,rst)
				begin
				  
					 if(rst ='1')then
						count <= 0;
						baudEnable <= '0';
						--baud96 <= '0';
						--baud1152 <= '0';
         		  	 elsif(rising_edge(sysclk))then
							case(baud_rate) is 
						when "00" => 
--
							   if(count = (5208))then
								baudEnable <= '1';
								count <= 0;
								else
								--	baud96 <= '1';
		Count_9600_Baud: 		baudEnable <= '0';
								count <= count + 1;
							   end if;

								
								
					    when "01" =>	

							   if(count = (434))then
								baudEnable <= '1';
								count <= 0;
									else
										--baud1152 <= '1';
		Count_1152_Baud : 		baudEnable <= '0';
								count <= count + 1;									
							   end if;
						
						when "10" => 
		Count_19200_Baud : 		baudEnable <= '0';
								count <= count + 1;
							   if(count = 625)then
								baudEnable <= '1';
								count <= 0;
							   end if;
						when others => 
										baudEnable <= '0';
	Count_25600_Baud : 			count <= count + 1;
							   if(count = 47)then
								baudEnable <= '1';
								count <= 0;
							   end if;
				   	end case;
				 end if;  
				
			end process;	
end rtl;