-- FX TRANSLATION & MONITORAGGIO COPERTURE 
SELECT 
    ge.asset_name AS [Asset Globale],
    ge.country_target AS [Paese],
    ge.local_currency AS [Valuta],
    ge.amount AS [Valore Nominale],
    
    -- 1. Conversione del valore dell'asset in Euro (Tasso Spot)
    ROUND(ge.amount / cpr.spot_exchange_rate, 2) AS [Controvalore in EUR],
    
    -- 2. Percentuale di copertura dell'asset tramite i contratti Forward
    ROUND((IFNULL(hc.amount_covered, 0) / ge.amount) * 100, 1) || '%' AS [% Copertura Rischio],
    
    -- 3. Contesto Macro: Tasso d'interesse della rispettiva Banca Centrale
    cbm.central_bank_name AS [Banca Centrale],
    cbm.policy_interest_rate || '%' AS [Tasso d'Interesse]

FROM global_exposures ge
JOIN currency_pairs_rates cpr ON ge.local_currency = cpr.quote_currency
JOIN central_banks_macro cbm ON ge.local_currency = cbm.currency_code
LEFT JOIN hedging_contracts hc ON ge.exposure_id = hc.exposure_id
WHERE cpr.base_currency = 'EUR';