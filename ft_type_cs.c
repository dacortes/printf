/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_type_cs.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dacortes <dacortes@student.42barcelona.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/18 16:17:07 by dacortes          #+#    #+#             */
/*   Updated: 2023/02/08 10:35:20 by dacortes         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include"ft_printf.h"

int	type_c(char c, int *i)
{
	if (write(1, &c, 1) == -1)
		return (-1);
	*i = (*i + 1);
	return (*i);
}

int	type_s(char *c, int *i)
{
	int	j;

	j = 0;
	if (!c)
		c = "(null)";
	while (c[j] != '\0')
	{
		if (type_c(c[j], i) == -1)
			return (-1);
		j++;
	}
	return (*i);
}
