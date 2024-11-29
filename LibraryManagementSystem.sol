// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract LibrarySystem{

    struct LibraryShelf{
        string title;
        string author;
        bool isAvailable;
    }

    mapping (string => uint256) bookToId;
    LibraryShelf[]books;

    function addBook(string memory _title, string memory _author
    )public {
        require(bookToId[_title] == 0, "This book already exists");
        books.push(LibraryShelf(_title, _author, true));
        bookToId[_title] = books.length;
    }
    //function to borrow book using the book name
    function borrowBook(string memory _title1)public {
        require(bookToId[_title1] > 0, "This book does not exist");
        uint256 _index = bookToId[_title1] -1;
        require(books[_index].isAvailable == true, 
        "This book is not available");
        books[_index].isAvailable = false;
    }

    //function to borrow book using the book id
    function borrowBookWithId(uint256 _id) public {
        require(books[_id].isAvailable == true,
        "This book is not available");
        books[_id].isAvailable = false;
    }

    //function to return book 
    function returnBook(string memory _title2) public{
        require(bookToId[_title2] > 0, 
        "This book does not belong here");
        uint256 _index2 = bookToId[_title2] -1;
        require(books[_index2].isAvailable == false, 
        "This Book is already Available");
        books[_index2].isAvailable = true;

    }

    //function to view books
    function getBook(uint256 _bookId) public view returns
    (string memory, string memory, bool){
        return(books[_bookId].title, books[_bookId].author, 
        books[_bookId].isAvailable);

    }

    


}
