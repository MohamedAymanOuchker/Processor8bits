
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor_tb is
end processor_tb;

architecture Behavioral of processor_tb is
    component processor
        Port ( clk : in STD_LOGIC;
               valeur : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal clk : STD_LOGIC := '0';
    signal valeur : STD_LOGIC_VECTOR (7 downto 0);
    
begin

    DUT : processor
    Port map (clk => clk,
              valeur => valeur);
    
    -- Clock process
    process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    process
    begin
        wait for 10 ns;
        
        -- Envoyer une instruction arithmétique
        -- Exemple : Addition de 5 et 3
        valeur <= "00000000"; -- Valeur d'entrée rs
        wait for 10 ns;
        valeur <= "00000011"; -- Valeur d'entrée rt
        wait for 10 ns;
        -- Attendre le résultat
        assert valeur = "00000100" report "Erreur : Résultat incorrect pour l'addition" severity error;
        
        -- Envoyer une instruction logique
        -- Exemple : ET logique entre 1010 et 1100
        valeur <= "00001010"; -- Valeur d'entrée rs
        wait for 10 ns;
        valeur <= "00001100"; -- Valeur d'entrée rt
        wait for 10 ns;
        -- Attendre le résultat
        assert valeur = "00001000" report "Erreur : Résultat incorrect pour l'opération logique" severity error;
        
        wait;
    end process;
    
end Behavioral;
