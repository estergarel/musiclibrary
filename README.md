# Musical Library Database Project

## Project Overview
This project is a database system designed for a music library application similar to Spotify. The goal is to efficiently manage musical artists, albums, songs, and categories, providing users with a structured and easily accessible catalog.

## Team Members
- Dumitru Diana – Ștefana
- Patrulea Eusebiu
- Rădulescu Diana – Alexandra
- Sava Gabriel
- Ștergărel Elisabeta – Elena
- Stoica George – Dănuț

## Database Structure

### Tables and Relationships:

- **tblBands**: Stores band information with fields like `id_band`, `nume`, `nr_membrii`, `an_fondare`, and `tara_origine`.

- **tblCategories**: Represents musical genres, with fields like `id_categorie` and `categorie`.

- **tblAlbums**: Contains album details, linked to bands through `id_band`. Key fields include `id_album`, `titlu`, `an_aparitie`, and `durata`.

- **tblSongs**: Holds song data, connected to albums and categories. Fields include `idMelodie`, `id_categorie`, `id_album`, `titlu`, and `durata_melodie`.

- **tblArtists**: Manages artist details, linked to bands via `id_band`. Fields include `idArtist`, `nume_artist`, `prenume_artist`, and `data_nasterii`.

- **tblComposers**: Tracks composers and their works, connected to bands and songs through `id_band` and `id_melodie`.

## Entity-Relationship Model (E/R)

- **One-to-Many Relationships:**
  - Bands to Albums
  - Bands to Artists
  - Bands to Composers
  - Albums to Songs
  - Categories to Songs
  - Songs to Composers

## Programming Concepts

- **SQL (Structured Query Language):** Core language for creating tables, defining relationships, and querying data.

- **Primary and Foreign Keys:** Used to uniquely identify records and establish connections between tables.

- **Normalization:** Ensures data is organized, reducing redundancy and enhancing data integrity.

- **Indexes:** Optimize query performance, especially for searching through large datasets.

## How to Use the Project
1. Import the SQL script (`script04.sql`) into your database management system (MySQL, MariaDB, etc.).
2. Run the script to create tables and set up relationships.
3. Use SQL queries to insert, update, or retrieve information about artists, albums, and songs.
