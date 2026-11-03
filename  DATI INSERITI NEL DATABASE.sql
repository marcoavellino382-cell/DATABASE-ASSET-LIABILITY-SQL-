-- DATI INSERITI NEL DATABASE 
-- 1. Popolamento Central Banks
INSERT INTO central_banks_macro (country_zone, currency_code, central_bank_name, policy_interest_rate, inflation_rate) VALUES 
('USA', 'USD', 'Federal Reserve', 4.50, 2.4),
('Eurozone', 'EUR', 'European Central Bank', 3.25, 2.0),
('UK', 'GBP', 'Bank of England', 4.75, 2.6),
('Japan', 'JPY', 'Bank of Japan', 0.25, 2.2);

-- 2. Popolamento Currency Pairs
INSERT INTO currency_pairs_rates (base_currency, quote_currency, spot_exchange_rate, last_update) VALUES 
('EUR', 'USD', 1.0850, '2026-11-03'),
('EUR', 'GBP', 0.8340, '2026-11-03'),
('EUR', 'JPY', 165.20, '2026-11-03');

-- 3. Inserimento Global Exposures 
INSERT INTO global_exposures (asset_name, local_currency, amount, country_target) VALUES 
('US Tech Growth Portfolio', 'USD', 15000000.00, 'USA'),
('London Commercial Real Estate', 'GBP', 8000000.00, 'UK');

-- 4. Inserimento Hedging Contracts
INSERT INTO hedging_contracts (exposure_id, contract_type, forward_rate, amount_covered, maturity_date) VALUES 
(1, 'FX Forward', 1.0720, 10000000.00, '2027-03-15'),
(2, 'FX Forward', 0.8250, 8000000.00, '2027-06-30');
