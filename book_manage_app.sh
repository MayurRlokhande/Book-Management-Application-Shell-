#! /bin/bash

add_book()
{
        read -p " Enter Name of Book to Add: " newBook
        books[$i]=$newBook
        let i++
        echo "$newBook Book Added Successfully"
        echo ""

}

delete_book()
{
        read -p " Enter Name Of the Book To Delete: " book_to_delete
        available="no"
        for index in ${!books[@]}
        do
                if [ ${books[$index]}  =  $book_to_delete ]; then
                        available="yes"
                        unset books[$index]
                        echo "$book_to_delete Book Deleted Successfully"
                        echo ""
                        break
                fi
        done
        if [ $available = "no" ]; then
                echo "$book_to_delete Book is not available, cannot deleted"
        fi
}
list_books()
{
        if [ ${#books[@]} -eq 0 ]; then
                echo "No Books are available"
                echo ""
                return 1
        fi
        echo "List Of All Available Books: "
        echo "-----------------------------------"
        

        for bk in ${books[@]};
        do
                echo $bk
        done
}


echo " Welcome To Mayur Book Management Application"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
declare -a books
i=0
while [ true ]
do
        read -p "Which Operation you want to perform [add |delete | list | exit]: " option
        case $option in 
                add)
                        add_book
                        ;;
                delete)
                        delete_book
                        ;;
                list)
                        list_books
                        ;;
                exit)
                        echo " Thanks For Using Our Application"
                        exit 0
                        ;;
                *)
                        echo " Oops Wrong Option! Try Again"

        esac
done
