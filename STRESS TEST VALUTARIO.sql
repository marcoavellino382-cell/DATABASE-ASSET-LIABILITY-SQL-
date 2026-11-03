-- STRESS TEST VALUTARIO 
SELECT 
    ge.asset_name AS [Asset],
    ge.local_currency AS [Valuta],
    ROUND(ge.amount / cpr.spot_exchange_rate, 2) AS [Valore Attuale (EUR)],
    
    -- 1. Simulazione del crollo del 10% della valuta estera (il tasso spot aumenta del 10%)
    ROUND(ge.amount / (cpr.spot_exchange_rate * 1.10), 2) AS [Valore Stress Test (EUR)],
    
    -- 2. Calcolo della perdita lorda teorica
    ROUND((ge.amount / (cpr.spot_exchange_rate * 1.10)) - (ge.amount / cpr.spot_exchange_rate), 2) AS [Perdita Lorda Potenziale],
    
    -- 3. Guadagno generato dalla copertura Forward che ha bloccato il tasso di cambio iniziale
    ROUND(
        CASE 
            WHEN hc.contract_id IS NOT NULL THEN 
                (hc.amount_covered / hc.forward_rate) - (hc.amount_covered / (cpr.spot_exchange_rate * 1.10))
            ELSE 0 
        END, 2
    ) AS [Guadagno da Copertura (Hedging P&L)]

FROM global_exposures ge
JOIN currency_pairs_rates cpr ON ge.local_currency = cpr.quote_currency
LEFT JOIN hedging_contracts hc ON ge.exposure_id = hc.exposure_id
WHERE cpr.base_currency = 'EUR';
