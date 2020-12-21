Renato Campos
Sept. 29, 2020
Cybersecurity HW 


1. All notes can be found in the 'notes' directory.

2. All original scripts can be found in the 'original_scripts' directory.

3. I was a little confused with how the format of the time arguement should look, so I
   decided to go with something simple. The format is:

	roulette_dealer_finder_by_name.sh <DATE> <TIME>

	where
		 DATE is in the format= <MMDD> 
	and
		 TIME is in the format= <HH:MMAM> (morning) or <HH:MMPM> (evening)

	example:
	
	roulette_dealer_finder_by_name.sh 0310 02:00PM 


4. Since I've copied and modified the dealer data I was given using cat, awk, and grep,
   I have also included that data file within the 'combined_dealer_data' directory.

5. To make things easy, I have modified the original scripts and placed them in a new
   directory called 'modified_scripts'. These will run correctly from their current 
   location after the 'Player_Dealer_Correlation' is unzipped.

6. The script 'date-time.sh' has the same parameters as 'roulette_dealer_finder_by_name.sh', but
   can only search the isolated schedules on 0310, 0312, and 0315. The script 'dealers-working.sh'
   does not take any parameters.

7. I was able to get the bonus script working! Here's how to use it:

	roulette_dealer_finder_by_time_and_game.sh <TIME> <DATE> <GAME>

	where
		 DATE is in the format= <MMDD> 
	and
		 TIME is in the format= <HH:MMAM> or <HH:MM:SSAM> (for morning) 
				        <HH:MMPM> or <HH:MM:SSPM> (for evening)
	and
		 GAME = (R/r)oulette , (B/b)ack(J/j)ack or (T/t)exas(H/h)old(E/e)m

	example:
	
	roulette_dealer_finder_by_time_and_game.sh 12:00:00AM 0310 texasholdem 

