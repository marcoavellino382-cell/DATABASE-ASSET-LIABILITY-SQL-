-- STRUTTURA DEL DATABASE 
PRAGMA foreign_keys = ON;

-- 1. CENTRAL BANKS MACRO
CREATE TABLE central_banks_macro (
bank_id INTEGER PRIMARY KEY AUTOINCREMENT,
country_zone TEXT NOT NULL,
currency_code TEXT NOT NULL UNIQUE,
central_bank_name TEXT NOT NULL,
policy_interest_rate REAL NOT NULL,
inflation_rate REAL NOT NULL
);

-- 2. CURRENCY PAIRS RATES
CREATE TABLE currency_pairs_rates (
paird_id INTEGER PRIMARY KEY AUTOINCREMENT, 
base_currency TEXT NOT NULL,
quote_currency TEXT NOT NULL,
spot_exchange_rate REAL NOT NULL,
last_update TEXT NOT NULL
);

-- 3. GLOBAL EXPOSURES (
CREATE TABLE global_exposures (
exposure_id INTEGER PRIMARY KEY AUTOINCREMENT,
asset_name TEXT NOT NULL,
local_currency TEXT NOT NULL,
amount REAL NOT NULL, 
country_target TEXT NOT NULL,
FOREIGN KEY (local_currency) REFERENCES central_banks_macro(currency_code)
);

-- 4. HEDGING CONTRACTS
CREATE TABLE hedging_contracts (
contract_id INTEGER PRIMARY KEY AUTOINCREMENT,
exposure_id INTEGER NOT NULL,
contract_type TEXT NOT NULL,
forward_rate REAL NOT NULL,
amount_covered REAL NOT NULL,
maturity_date TEXT NOT NULL,
FOREIGN KEY (exposure_id) REFERENCES global_exposures(exposure_id) ON DELETE CASCADE
);

