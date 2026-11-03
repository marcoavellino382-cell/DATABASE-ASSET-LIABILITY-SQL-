# Global FX Risk Management & Macro Hedging System

Un sistema di database relazionale ad alte prestazioni sviluppato in **SQLite (tramite DBeaver)** progettato per la gestione della tesoreria internazionale, il monitoraggio del rischio di cambio (FX Risk) e la simulazione di stress test macroeconomici per fondi di investimento globali.

## 📊 Overview del Progetto
Nelle istituzioni finanziarie moderne, la fluttuazione delle valute estere e le decisioni di politica monetaria delle banche centrali possono erodere rapidamente i rendimenti degli investimenti. Questo progetto implementa un'infrastruttura dati centralizzata che permette a un fondo con contabilità in **Euro (EUR)** di monitorare i propri asset globali (es. USA e UK), misurare l'esposizione al rischio di cambio e calcolare l'efficacia dei contratti di copertura derivati (**FX Forwards**).

Il database non si limita ad archiviare i dati, ma funge da vero e proprio motore di calcolo per simulare shock macroeconomici geopolitici direttamente tramite query SQL ottimizzate.

## 🗂️ Architettura del Database (Schema Relazionale)
Il database mappa i dati macro, le matrici di cambio e i contratti finanziari attraverso relazioni strutturate:

*   **`central_banks_macro`**: Registro delle principali banche centrali mondiali (FED, BCE, BoE, BoJ), con tracciamento dei tassi di interesse ufficiali (Policy Rates) e tassi di inflazione.
*   **`currency_pairs_rates`**: Matrice dei tassi di cambio spot (es. EUR/USD, EUR/GBP) per il consolidamento valutario.
*   **`global_exposures`**: Inventario degli asset fisici o azionari detenuti all'estero, legati alla rispettiva valuta locale tramite vincoli di integrità referenziale.
*   **`hedging_contracts`**: Registro dei contratti derivati di copertura (FX Forward), con memorizzazione del tasso di cambio bloccato (Forward Rate) e dell'importo totale coperto, collegato in cascata (`ON DELETE CASCADE`) alle esposizioni.

---

## 📈 Query Finanziarie e Analisi di Scenario Implementate

### 1. FX Translation & Report di Consolidamento Valutario
*   **Obiettivo**: Convertire istantaneamente il valore di tutti gli asset esteri nella valuta di reporting del fondo (EUR) utilizzando la matrice di cambio Spot, calcolando al contempo la percentuale esatta di rischio coperta per ogni singola esposizione.
*   **Evidenza Tecnica SQL**: Utilizzo di `LEFT JOIN` e funzioni di gestione dei valori nulli (`IFNULL`) per garantire l'inclusione nei report analitici anche di asset non protetti da coperture derivate, evitando perdite di record.

### 2. Stress Testing Valutario e Calcolo dell'Hedging P&L (Shock Macro)
*   **Obiettivo**: Simulare uno scenario di forte instabilità geopolitica (es. svalutazione improvvisa del 10% di USD e GBP rispetto all'EUR) per calcolare la perdita lorda potenziale del fondo e il guadagno compensativo generato dalla strategia di Hedging (paracadute valutario).
*   **Evidenza Tecnica SQL**: Utilizzo di costrutti logici condizionali complessi (`CASE WHEN`) integrati con formule matematiche finanziarie per calcolare dinamicamente il P&L dei derivati assecondando le variazioni dei tassi di cambio.

---
